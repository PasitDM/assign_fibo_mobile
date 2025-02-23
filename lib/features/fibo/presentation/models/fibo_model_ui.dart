enum FiboType { circle, cross, square }

class FiboModel {
  final int index;
  final int value;
  final FiboType type;

  FiboModel({required this.index, required this.value, required this.type});
}
