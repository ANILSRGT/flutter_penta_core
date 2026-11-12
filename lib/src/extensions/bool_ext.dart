/// Gives access to [BoolExt] through `value.ext`.
extension BoolExtension on bool {
  BoolExt get ext => BoolExt(this);
}

extension type const BoolExt(bool _value) {
  /// Negated value, handy at the end of a call chain.
  bool get not => !_value;

  /// `1` when true, `0` otherwise.
  int get toInt => _value ? 1 : 0;

  /// Returns [ifTrue] or [ifFalse] depending on the value.
  T pick<T>(T ifTrue, T ifFalse) => _value ? ifTrue : ifFalse;
}
