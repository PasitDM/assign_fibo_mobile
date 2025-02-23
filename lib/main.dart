import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/fibo/presentation/screens/fibo_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assign Fibonacci',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: FiboScreen(),
    );
  }
}
