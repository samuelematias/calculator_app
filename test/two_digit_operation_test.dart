import 'package:calculator/calculator.dart';
import 'package:calculator_app/models/models.dart';
import 'package:calculator_app/two_digit_operation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCalculator extends Mock implements Calculator {}

void main() {
  Calculator calculator;

  setUp(() {
    calculator = MockCalculator();
  });

  group('TwoDigitOperation', () {
    group('Operation.add', () {
      testWidgets('paints 4.0 when adding 3 and 1', (tester) async {
        when(calculator.add(3, 1)).thenReturn(4);
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TwoDigitOperation(
                operation: Operations.add,
                calculator: calculator,
              ),
            ),
          ),
        );
        await tester.enterText(
          find.byKey(const Key('textField_top_plus')),
          '3',
        );
        await tester.enterText(
          find.byKey(const Key('textField_bottom_plus')),
          '1',
        );
        await tester.pumpAndSettle();
        expect(find.text('is 4.0'), findsOneWidget);
      });
    });
  });
}
