import 'package:calculator_app/main.dart';
import 'package:calculator_app/two_digit_operation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CalculatorApp', () {
    testWidgets('matches golden file', (tester) async {
      await tester.pumpWidget(CalculatorApp());
      await expectLater(
        find.byType(CalculatorApp),
        matchesGoldenFile('goldens/calculator_app.png'),
      );
    }, tags: 'no-ci');

    testWidgets('renders four widgets of type TwoDigitOperation',
        (WidgetTester tester) async {
      await tester.pumpWidget(CalculatorApp());
      expect(find.byType(TwoDigitOperation), findsNWidgets(4));
    });

    testWidgets('there are zero buttons in the screen', (tester) async {
      await tester.pumpWidget(CalculatorApp());
      expect(find.byType(RaisedButton), findsNothing);
    });

    group('add', () {
      testWidgets('shows result when given two numbers', (tester) async {
        await tester.pumpWidget(CalculatorApp());
        final topTextFieldFinder = find.byKey(Key('textField_top_plus'));
        final bottomTextFieldFinder = find.byKey(Key('textField_bottom_plus'));

        await tester.ensureVisible(topTextFieldFinder);
        await tester.tap(topTextFieldFinder);
        await tester.enterText(topTextFieldFinder, '3');

        await tester.ensureVisible(bottomTextFieldFinder);
        await tester.tap(bottomTextFieldFinder);
        await tester.enterText(bottomTextFieldFinder, '6');

        await tester.pumpAndSettle();
        expect(find.text('is 9.0'), findsOneWidget);
      });
    });
  });
}
