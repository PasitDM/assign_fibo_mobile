import 'package:assign_fibo_mobile/features/fibo/presentation/screens/fibo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('FiboScreen Golden Test', (WidgetTester tester) async {
    // Set the screen size
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    await binding.setSurfaceSize(const Size(375, 812)); // Set to the size of your simulator

    // Build the FiboScreen widget
    await tester.pumpWidget(MaterialApp(home: FiboScreen()));

    // Take a golden screenshot
    await expectLater(find.byType(FiboScreen), matchesGoldenFile('golden/fibo_screen.png'));

    // Reset the screen size
    await binding.setSurfaceSize(null);
  });
}
