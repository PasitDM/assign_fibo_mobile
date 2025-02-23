import 'package:flutter/material.dart';

import '../models/fibo_model_ui.dart';

class FiboListTile extends StatelessWidget {
  final FiboModel fibonacciNumber;
  final bool isHighlighted;
  final VoidCallback onTap;
  final Color color;

  const FiboListTile({
    super.key,
    required this.fibonacciNumber,
    required this.isHighlighted,
    required this.onTap,
    this.color = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Index: ${fibonacciNumber.index}, Number: ${fibonacciNumber.value.toString()}'),
      trailing: Icon(_getIcon(fibonacciNumber.type)),
      tileColor: isHighlighted ? color : null,
      onTap: onTap,
    );
  }

  IconData _getIcon(FiboType type) {
    switch (type) {
      case FiboType.circle:
        return Icons.circle;
      case FiboType.cross:
        return Icons.close;
      case FiboType.square:
        return Icons.square_outlined;
    }
  }
}
