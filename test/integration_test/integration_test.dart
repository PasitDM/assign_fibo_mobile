import 'package:assign_fibo_mobile/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Full app integration test', (WidgetTester tester) async {
    // Start the app
    app.main();
    await tester.pumpAndSettle();

    // Verify that the Fibonacci list is displayed correctly
    expect(find.text('Index: 0, Number: 0'), findsOneWidget);

    // Tap the first Fibonacci number
    await tester.tap(find.text('Index: 0, Number: 0'));
    await tester.pumpAndSettle();

    // Verify that the bottom sheet is displayed
    expect(find.byType(BottomSheet), findsOneWidget);

    // Tap the number in the bottom sheet to remove it
    await tester.tap(find.text('Number: 0'));
    await tester.pumpAndSettle();

    // Verify that the bottom sheet is closed
    expect(find.byType(BottomSheet), findsNothing);

    // Verify that the number is added back to the main list
    expect(find.text('Index: 0, Number: 0'), findsOneWidget);
  });
}
