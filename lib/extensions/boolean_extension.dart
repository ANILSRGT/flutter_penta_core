part of 'extensions.dart';

extension BooleanExtension on bool {
  bool xor(bool other) => this != other;
  bool xnor(bool other) => this == other;
  bool nand(bool other) => !(this && other);
  bool nor(bool other) => !(this || other);
  bool get not => !this;

  bool operator ~() => not;
}
