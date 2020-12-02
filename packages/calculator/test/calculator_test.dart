import 'package:calculator/calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('the calculator returns 4 when adding 2 and 2', () {
    final calculator = Calculator();
    final result = calculator.add(2, 2);
    // A test without expect() is considered a bad practice
    expect(result, 4.00000, reason: 'It should be exactly 4');
  });
}
