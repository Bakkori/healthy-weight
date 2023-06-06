import 'package:bmi_calc_2/models/bmi_calculations.dart';
import 'package:flutter/material.dart';
import 'input_screen.dart';
import 'bmi_status.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key, required this.bmiCalculations})
      : super(key: key);

  final BMICalculations bmiCalculations;

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  TextStyle style1 = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w500, color: Colors.grey[800]);
  TextStyle style2 = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey[800]);

  @override
  Widget build(BuildContext context) {
    final bmiDescription = BMIDescription(
        widget.bmiCalculations.getBestWeight(),
        widget.bmiCalculations.getBestMinWeight(),
        widget.bmiCalculations.getBestMaxWeight(),
        widget.bmiCalculations.weight,
        bmi: widget.bmiCalculations.getBMI());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[50],
          foregroundColor: Colors.cyan,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.yourBMIis,
                  style: style1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: bmiDescription.getBMI(),
                ),
                Text(
                  bmiDescription.getStatus(context),
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: bmiDescription.getStatusColors()),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Text(
                    '${AppLocalizations.of(context)!.yourIdealWeightIs}'
                    ' ${widget.bmiCalculations.getBestMinWeight().toStringAsFixed(1)}'
                    ' ${AppLocalizations.of(context)!.and} ${widget.bmiCalculations.getBestMaxWeight().toStringAsFixed(1)} ${AppLocalizations.of(context)!.kg}',
                    style: style2,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: bmiDescription.gainOrlose(context),
                )
              ],
            ),
            bottomBox(context)
          ],
        ),
      ),
    );
  }
}

bottomBox(BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Column(
        children: [
          Container(
            // width: 300,
            height: 150,
            color: Colors.grey[50],
          ),
          Container(
            //  width: 300,
            height: 150,
            color: Colors.cyan,
          ),
        ],
      ),
      Column(
        children: [
          Align(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InputScreen()));
              },
              child: Container(
                width: 160,
                height: 50,
                child: Center(
                    child: Text(
                  AppLocalizations.of(context)!.back,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.50),
                        offset: const Offset(0, 3.0),
                        blurRadius: 6.0,
                      )
                    ]),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
