// ignore_for_file: prefer_final_fields, no_leading_underscores_for_local_identifiers

import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;

  double? _bmi = 0;
  CalculatorBrain({required this.height, required this.weight});

  String calculateBMI() {
    double _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi! >= 25 && _bmi! < 30) {
      return 'Overweight';
    } else if (_bmi! < 18.5) {
      return 'underweight';
    } else if (_bmi! >= 18.5 && _bmi! < 25) {
      return 'normal';
    } else {
      return 'Obese';
    }
  }

  String getInterpretation() {
    if (_bmi! > 25 && _bmi! <= 30) {
      return 'You have a higher than normal body weight. Try to exercise more';
    } else if (_bmi! <= 18.5) {
      return 'You have a lower than normal body weight. You can eat a bit more';
    } else if (_bmi! > 18.5 && _bmi! < 25) {
      return 'You have normal body weight. Good job!';
    } else {
      return 'You are Obese, Kindly see a doctor';
    }
  }
}
