import 'package:flutter/material.dart';

enum FiboType { circle, cross, square }

extension FiboTypeExtension on FiboType {
  IconData get icon {
    switch (this) {
      case FiboType.circle:
        return Icons.circle;
      case FiboType.cross:
        return Icons.close;
      case FiboType.square:
        return Icons.square_outlined;
    }
  }
}

class FiboModel {
  final int index;
  final int value;
  final FiboType type;

  FiboModel({required this.index, required this.value, required this.type});
}
