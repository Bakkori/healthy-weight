import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

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
    } else if (bmi > 24.9) {
      return Colors.amber;
    } else if (bmi >= 18.50) {
      return Colors.green;
    } else {
      return Colors.blueGrey;
    }
  }

  Text getBMI() {
    print('$bmi description');
    return Text(
      bmi.toStringAsFixed(2),
      style: TextStyle(
          fontSize: 50, fontWeight: FontWeight.bold, color: getStatusColors()),
    );
  }

  String getStatus(BuildContext context) {
    if (bmi > 35) {
      return AppLocalizations.of(context)!.weightHighObesity;
    } else if (bmi > 30) {
      return AppLocalizations.of(context)!.weightObesity;
    } else if (bmi > 24.9) {
      return AppLocalizations.of(context)!.overWeight;
    } else if (bmi >= 18.50 && bmi <= 24.9) {
      return AppLocalizations.of(context)!.weightnormal;
    } else {
      return AppLocalizations.of(context)!.weightLoss;
    }
  }

  Text gainOrlose(BuildContext context) {
    TextStyle s1 = TextStyle(
        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey[850]);

    if (bmi < 18.5) {
      return Text(
        '${AppLocalizations.of(context)!.youNeedGain} ${(bestMinWeight - weight).toStringAsFixed(2)} kg ${AppLocalizations.of(context)!.atLeast}',
      );
    } else if (bmi > 24.9) {
      return Text(
        '${AppLocalizations.of(context)!.youNeedLoss} ${(weight - bestMaxWeight).toStringAsFixed(2)} kg ${AppLocalizations.of(context)!.atLeast}',
      );
    } else {
      return const Text(' ');
    }
  }
}
