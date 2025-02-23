import 'package:assign_fibo_mobile/features/fibo/presentation/screens/fibo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Fibonacci List displays correctly', (WidgetTester tester) async {
    // Build the FiboScreen widget
    await tester.pumpWidget(MaterialApp(home: FiboScreen()));

    // Verify that the Fibonacci list is displayed correctly
    expect(find.text('Index: 0, Number: 0'), findsOneWidget);
    expect(find.text('Index: 1, Number: 1'), findsOneWidget);
    expect(find.text('Index: 2, Number: 1'), findsOneWidget);
    expect(find.text('Index: 3, Number: 2'), findsOneWidget);
    expect(find.text('Index: 4, Number: 3'), findsOneWidget);
  });

  testWidgets('Move and remove Fibonacci number', (WidgetTester tester) async {
    // Build the FiboScreen widget
    await tester.pumpWidget(MaterialApp(home: FiboScreen()));

    // Tap the first Fibonacci number
    await tester.tap(find.text('Index: 0, Number: 0'));
    await tester.pump();

    // Verify that the bottom sheet is displayed
    expect(find.byType(BottomSheet), findsOneWidget);

    // Scroll until the number in the bottom sheet is visible
    await tester.dragUntilVisible(
      find.text('Number: 0'), // The widget to find
      find.byType(ListView), // The widget to scroll
      const Offset(0, -50), // The scroll direction and amount
    );
    await tester.pumpAndSettle();

    // Tap the number in the bottom sheet to remove it
    await tester.tap(find.text('Number: 0'));
    await tester.pumpAndSettle();

    // Verify that the bottom sheet is closed
    expect(find.byType(BottomSheet), findsNothing);

    // Verify that the number is added back to the main list
    expect(find.text('Index: 0, Number: 0'), findsOneWidget);
  });
}
