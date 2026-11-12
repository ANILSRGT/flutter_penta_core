import 'package:flutter/foundation.dart';

/// Pairs a [model] with its [id] (e.g. a document and its Firestore id).
@immutable
class ModelWithId<T, ID> {
  const ModelWithId({required this.id, required this.model});

  final ID id;
  final T model;

  ModelWithId<T, ID> copyWith({ID? id, T? model}) =>
      ModelWithId(id: id ?? this.id, model: model ?? this.model);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelWithId<T, ID> && other.id == id && other.model == model;

  @override
  int get hashCode => Object.hash(id, model);

  @override
  String toString() => 'ModelWithId(id: $id, model: $model)';
}
