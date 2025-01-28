abstract interface class IUseCaseNoFutureNoResponseWithParams<T, Params> {
  T execute(Params params);
}
