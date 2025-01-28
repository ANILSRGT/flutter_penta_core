abstract interface class IUseCaseNoResponseWithParams<T, Params> {
  Future<T> execute(Params params);
}
