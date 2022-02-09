import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.wight});

  final int height;
  final int wight;
  double? _bmi;
  String calculatorBmi() {
    _bmi = wight / pow(height / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String getInterpretation() {
    if (_bmi! >= 25) {
      return "You have a higher than normal body wight,Try to exercise more.";
    } else if (_bmi! > 18.5) {
      return "You have a normal body, Good job!";
    } else {
      return "You have a Lower than normal body wight,You can eat a bit more";
    }
  }

  String getResult() {
    if (_bmi! >= 25) {
      return "OverWight";
    } else if (_bmi! > 18.5) {
      return "Normal";
    } else {
      return "UnderWight";
    }
  }
}
