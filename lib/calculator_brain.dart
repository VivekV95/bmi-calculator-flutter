import 'dart:math';

class CalculatorBrain {
  final int height, weight;

  double _bmi;

  CalculatorBrain(this.height, this.weight);

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Never get on a plane again';
    } else if (_bmi > 18.5) {
      return 'You do you';
    } else {
      return 'Stuff your face';
    }
  }
}
