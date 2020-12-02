enum Operations {
  add,
  substract,
  multiply,
  divide,
}

extension OperationX on Operations {
  String get description {
    switch (this) {
      case Operations.add:
        return 'plus';
      case Operations.substract:
        return 'minus';
      case Operations.multiply:
        return 'multiplied by';
      case Operations.divide:
      default:
        return 'divided by';
    }
  }
}
