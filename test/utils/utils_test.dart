import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:penta_core/penta_core.dart';

void main() {
  group('FirebaseExceptionConverter', () {
    test('matches exact locale', () {
      expect(
        FirebaseExceptionConverter.getMessage(
          'user-not-found',
          locale: const Locale('tr', 'TR'),
        ),
        'Kullanıcı bulunamadı.',
      );
    });

    test('falls back to language only', () {
      expect(
        FirebaseExceptionConverter.getMessage(
          'user-not-found',
          locale: const Locale('tr'),
        ),
        'Kullanıcı bulunamadı.',
      );
    });

    test('normalizes auth/ prefix and aliases', () {
      final wrong = FirebaseExceptionConverter.getMessage('wrong-password');
      expect(
        FirebaseExceptionConverter.getMessage('auth/invalid-credential'),
        wrong,
      );
      expect(
        FirebaseExceptionConverter.getMessage('INVALID_LOGIN_CREDENTIALS'),
        wrong,
      );
    });

    test('unknown code and locale use defaults', () {
      expect(
        FirebaseExceptionConverter.getMessage(
          'something',
          locale: const Locale('xx'),
        ),
        'An error occurred, please try again later.',
      );
    });
  });

  test('TimestampConverter', () {
    const ms = 1700000000000;
    expect(TimestampConverter.convertToDateTimeUTC(ms).isUtc, isTrue);
    expect(TimestampConverter.convertToDateTimeLocal(ms).isUtc, isFalse);
    expect(
      TimestampConverter.convertToTimestamp(
        TimestampConverter.convertToDateTimeUTC(ms),
      ),
      ms,
    );
  });

  group('PentaDebouncer', () {
    test('instance runs only the last action', () {
      fakeAsync((async) {
        final debouncer = PentaDebouncer(const Duration(milliseconds: 100));
        final calls = <int>[];
        debouncer
          ..run(() => calls.add(1))
          ..run(() => calls.add(2));
        async.elapse(const Duration(milliseconds: 150));
        expect(calls, [2]);
      });
    });

    test('debounce completes superseded calls with null', () {
      fakeAsync((async) {
        final fn = PentaDebouncer.debounce<String, String>(
          debounceDuration: const Duration(milliseconds: 100),
          function: (value) => 'r:$value',
        );
        String? first = 'unset';
        String? second;
        unawaited(fn('a').then((v) => first = v));
        unawaited(fn('b').then((v) => second = v));
        async.elapse(const Duration(milliseconds: 150));
        expect(first, isNull);
        expect(second, 'r:b');
      });
    });
  });

  test('PentaEventBus filters by type', () async {
    final bus = PentaEventBus<Object>(sync: true);
    final ints = <int>[];
    final sub = bus.on<int>().listen(ints.add);
    bus
      ..fire(1)
      ..fire('x')
      ..fire(2);
    await sub.cancel();
    await bus.destroy();
    expect(ints, [1, 2]);
    expect(bus.isClosed, isTrue);
  });

  group('ImageStringConverter', () {
    test('resolves providers', () {
      expect(
        ImageStringConverter.toImageProvider('https://x.com/a.png'),
        isA<NetworkImage>(),
      );
      expect(
        ImageStringConverter.toImageProvider('assets/a.png'),
        isA<AssetImage>(),
      );
      expect(
        ImageStringConverter.toImageProvider('data:image/png;base64,AQID'),
        isA<MemoryImage>(),
      );
      expect(
        ImageStringConverter.toImageProvider('/tmp/a.png'),
        isA<FileImage>(),
      );
      expect(ImageStringConverter.toImageProvider(''), isNull);
    });
  });

  test('DataRepoMixin picks the source by connectivity', () async {
    final online = _Repo(connected: true);
    final offline = _Repo(connected: false);
    Future<String> local() async => 'local';
    Future<String> remote() async => 'remote';

    expect(
      await online.executeByDatasource(
        localCallback: local,
        remoteCallback: remote,
      ),
      'remote',
    );
    expect(
      await offline.executeByDatasource(
        localCallback: local,
        remoteCallback: remote,
      ),
      'local',
    );
  });
}

class _Repo with DataRepoMixin {
  _Repo({required this.connected});
  final bool connected;

  @override
  Future<bool> get hasConnection async => connected;
}
