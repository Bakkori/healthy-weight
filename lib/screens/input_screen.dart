import 'package:bmi_calc_2/models/bmi_calculations.dart';
import 'package:bmi_calc_2/screens/welcome_screen.dart';
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
                height: 100,
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
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        if ((int.parse(heightController.text)) <= 0 ||
                            int.parse(weightContoller.text) <= 0) {
                          setState(() {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                              AppLocalizations.of(context)!
                                                  .close))
                                    ],
                                    title: Text(
                                        AppLocalizations.of(context)!.note),
                                    content: Text(AppLocalizations.of(context)!
                                        .mustBePositive),
                                  );
                                });
                          });
                          return;
                        }
                        if (heightController.text.isNotEmpty &&
                            weightContoller.text.isNotEmpty) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  // ignore: prefer_const_constructors
                                  builder: (context) => ResultScreen(
                                        bmiCalculations: BMICalculations(
                                            height: double.parse(
                                                heightController.text),
                                            weight: double.parse(
                                                weightContoller.text)),
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
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  // ignore: prefer_const_constructors
                                  builder: (context) => WelcomeScreen()));
                        },
                        child: Text(
                          AppLocalizations.of(context)!.back,
                          style: const TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.grey[50],
          //   foregroundColor: Colors.cyan,
          //   elevation: 0,
          // ),
          body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                userInputField(
                    context,
                    AppLocalizations.of(context)!.enterHeight,
                    heightController),
                const SizedBox(
                  height: 10,
                ),
                userInputField(context,
                    AppLocalizations.of(context)!.enterWeight, weightContoller),
              ],
            ),
          ),
          bottomBox(context)
        ],
      )),
    );
  }

  TextField userInputField(BuildContext context, String labelText,
      TextEditingController editingController) {
    return TextField(
      textAlign: TextAlign.right,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)))),
      controller: editingController,
    );
  }
}
