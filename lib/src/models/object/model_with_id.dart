class ModelWithId<T, ID> extends Object {
  const ModelWithId({
    required this.id,
    required this.model,
  });

  final ID id;
  final T model;
}
