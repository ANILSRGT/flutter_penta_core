import 'package:flutter_test/flutter_test.dart';
import 'package:penta_core/penta_core.dart';

void main() {
  const error = ErrorModel(message: 'boom', code: '500');

  test('success / fail accessors', () {
    final ok = ResponseModel<int>.success(1);
    final ko = ResponseModel<int>.fail(error);

    expect(ok.isSuccess, isTrue);
    expect(ok.dataOrNull, 1);
    expect(ok.errorOrNull, isNull);
    expect(ko.isFail, isTrue);
    expect(ko.dataOrNull, isNull);
    expect(ko.errorOrNull, error);
  });

  test('when / maybeWhen / whenOrNull', () {
    const ResponseModel<int> ok = ResponseModelSuccess(data: 2);
    expect(ok.when(onSuccess: (d) => d * 2, onFail: (_) => -1), 4);
    expect(ok.maybeWhen(orElse: () => 0, onFail: (_) => -1), 0);
    expect(ok.whenOrNull<int?>(onSuccess: (_) => null), isNull);
  });

  test('map and then', () async {
    const ResponseModel<int> ok = ResponseModelSuccess(data: 2);
    const ResponseModel<int> ko = ResponseModelFail(error: error);

    expect(ok.map((d) => '$d').dataOrNull, '2');
    expect(ko.map((d) => '$d').errorOrNull, error);

    final chained = await ok.then((d) => ResponseModel<String>.success('v$d'));
    expect(chained.dataOrNull, 'v2');
  });

  test('guard captures exceptions', () async {
    final ok = await ResponseModel.guard(() async => 5);
    final ko = await ResponseModel.guard<int>(() => throw StateError('x'));

    expect(ok.dataOrNull, 5);
    expect(ko.errorOrNull?.error, isA<StateError>());
  });

  test('equality and castTo', () {
    expect(
      const ResponseModelSuccess(data: 1),
      const ResponseModelSuccess(data: 1),
    );
    expect(
      const ResponseModelFail<int>(error: error).castTo<String>(),
      isA<ResponseModelFail<String>>(),
    );
  });

  test('exhaustive switch', () {
    const ResponseModel<int> response = ResponseModelFail(error: error);
    final text = switch (response) {
      ResponseModelSuccess(:final data) => '$data',
      ResponseModelFail(:final error) => error.message,
    };
    expect(text, 'boom');
  });
}
