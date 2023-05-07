import 'package:flutter/material.dart';

class BMIDescription {
  BMIDescription(
      this.bestWeight, this.bestMinWeight, this.bestMaxWeight, this.weight,
      {required this.bmi});

  final double bmi;
  final double bestWeight;
  final double bestMinWeight;
  final double bestMaxWeight;
  final double weight;

  Color getStatusColors() {
    if (bmi > 35) {
      return Colors.red;
    } else if (bmi > 30) {
      return Colors.orange;
    } else if (bmi > 25) {
      return Colors.amber;
    } else if (bmi >= 18.50 && bmi <= 24.9) {
      return Colors.green;
    } else {
      return Colors.blueGrey;
    }
  }

  Text getBMI() {
    return Text(
      bmi.toStringAsFixed(2),
      style: TextStyle(
          fontSize: 50, fontWeight: FontWeight.bold, color: getStatusColors()),
    );
  }

  String getStatus() {
    if (bmi > 35) {
      return 'أنت تعاني من السمنة المفرطة';
    } else if (bmi > 30) {
      return 'أنت تعاني من السمنة';
    } else if (bmi > 25) {
      return 'لديك زيادة في الوزن';
    } else if (bmi >= 18.50 && bmi <= 24.9) {
      return 'وزنك طبيعي';
    } else {
      return 'لديك نقص في الوزن';
    }
  }

  Text gainOrlose() {
    TextStyle s1 = TextStyle(
        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey[850]);

    if (bmi < 18.5) {
      return Text(
        'يجب أن تزيد ${(bestMinWeight - weight).toStringAsFixed(0)} kg على الأقل',
        textDirection: TextDirection.rtl,
      );
    } else if (bmi > 24.9) {
      return Text(
          'يجب أن تخسر ${(weight - bestMaxWeight).toStringAsFixed(0)} kg على الأقل',
          textDirection: TextDirection.rtl);
    } else {
      return const Text(' ');
    }
  }
}
