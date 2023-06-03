import 'package:bmi_calc_2/models/bmi_calculations.dart';
import 'package:flutter/material.dart';
import 'result_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final heightController = TextEditingController();
  final weightContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const s1 = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);

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
                //alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    if (heightController.text.isNotEmpty &&
                        weightContoller.text.isNotEmpty) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              // ignore: prefer_const_constructors
                              builder: (context) => ResultScreen(
                                    bmiCalculations: BMICalculations(
                                        height:
                                            double.parse(heightController.text),
                                        weight:
                                            double.parse(weightContoller.text)),
                                  )));
                    } else {
                      return;
                    }
                  },
                  child: Container(
                    width: 160,
                    height: 50,
                    child: Center(
                        child: Text(
                      AppLocalizations.of(context)!.next,
                      style: s1,
                    )),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        border: Border.all(
                          width: 1.0,
                          color: Colors.white,
                          // color: const Color(0xFF707070),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.50),
                            offset: Offset(0, 3.0),
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

    return SafeArea(
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // ignore: prefer_const_constructors
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.enterHeight,
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)))),
                    controller: heightController,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.enterWeight,
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)))),
                    controller: weightContoller,
                  ),
                ),
              ],
            ),
          ),
          bottomBox(context)
        ],
      )),
    );
  }
}
