import 'package:calculator_app/models/models.dart';
import 'package:calculator_app/pi.dart';
import 'package:calculator_app/power_of_two.dart';
import 'package:calculator_app/two_digit_operation.dart';
import 'package:flutter/material.dart';
import 'package:calculator/calculator.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final calculator = Calculator();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: SafeArea(
              child: Column(
                children: [
                  PowerOfTwo(calculator: calculator),
                  Divider(),
                  Pi(calculator: calculator),
                  Divider(),
                  TwoDigitOperation(
                    calculator: calculator,
                    operation: Operations.add,
                  ),
                  Divider(),
                  TwoDigitOperation(
                    calculator: calculator,
                    operation: Operations.substract,
                  ),
                  Divider(),
                  TwoDigitOperation(
                    calculator: calculator,
                    operation: Operations.multiply,
                  ),
                  Divider(),
                  TwoDigitOperation(
                    calculator: calculator,
                    operation: Operations.divide,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
