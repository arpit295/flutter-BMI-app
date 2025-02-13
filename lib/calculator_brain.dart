import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;

  String calculateBMI() {
    double bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    double bmi = weight / pow(height / 100, 2);
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    double bmi = weight / pow(height / 100, 2);
    if (bmi >= 25) {
      return 'You Have A Higher Than Normal Body Weight.Try To Exercise More';
    } else if (bmi > 18.5) {
      return 'You Have A Normal Body Weight.Good Job !';
    } else {
      return 'You Have A Lower Than Normal Body Weight.You Can Eat A More ';
    }
  }
}
