import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../models/fibo_model_ui.dart';

class FiboListTile extends StatelessWidget {
  final FiboModel fibonacciNumber;
  final VoidCallback onTap;
  final bool isHighlighted;
  final Color color;
  final String titleText;
  final String? subtitleText;

  const FiboListTile({
    super.key,
    required this.fibonacciNumber,
    required this.isHighlighted,
    required this.onTap,
    this.color = Colors.green,
    required this.titleText,
    this.subtitleText,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(titleText),
      subtitle:
          subtitleText != null
              ? Text(
                subtitleText!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.descColor),
              )
              : null,
      trailing: Icon(fibonacciNumber.type.icon),
      tileColor: isHighlighted ? color : null,
      onTap: onTap,
    );
  }
}
