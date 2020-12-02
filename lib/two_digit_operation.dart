import 'package:calculator/calculator.dart';
import 'package:calculator_app/models/models.dart';
import 'package:flutter/material.dart';

class TwoDigitOperation extends StatefulWidget {
  const TwoDigitOperation({
    @required this.operation,
    @required this.calculator,
  });

  final Operations operation;
  final Calculator calculator;

  @override
  _TwoDigitOperationState createState() => _TwoDigitOperationState();
}

class _TwoDigitOperationState extends State<TwoDigitOperation> {
  final _topTextController = TextEditingController();
  final _bottomTextController = TextEditingController();

  String _operationResult;

  @override
  void initState() {
    _topTextController.addListener(_getResult);
    _bottomTextController.addListener(_getResult);
    super.initState();
  }

  @override
  void dispose() {
    _topTextController?.dispose();
    _bottomTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _topTextController,
          keyboardType: TextInputType.number,
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Text(
                widget.operation.description,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: _bottomTextController,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        Text(
          'is ${_operationResult ?? '???'}',
          style: Theme.of(context).textTheme.headline5,
        ),
      ],
    );
  }

  void _getResult() {
    if (_topTextController.text.isNotEmpty &&
        _bottomTextController.text.isNotEmpty) {
      try {
        final result = _calculate(
          double.tryParse(_topTextController.text),
          double.tryParse(_bottomTextController.text),
        );
        setState(() {
          _operationResult = result.toString();
        });
      } catch (_) {
        setState(() {
          _operationResult = null;
        });
      }
    }
  }

  double _calculate(double top, double bottom) {
    double result;
    switch (widget.operation) {
      case Operations.add:
        result = widget.calculator.add(top, bottom);
        break;
      case Operations.substract:
        result = widget.calculator.substract(top, bottom);
        break;
      case Operations.multiply:
        result = widget.calculator.multiply(top, bottom);
        break;
      case Operations.divide:
        result = widget.calculator.divide(top, bottom);
        break;
    }
    return result;
  }
}
