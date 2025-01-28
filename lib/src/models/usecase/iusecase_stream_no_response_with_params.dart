abstract interface class IUseCaseStreamNoResponseWithParams<T, Params> {
  Stream<T> execute(Params params);
}
