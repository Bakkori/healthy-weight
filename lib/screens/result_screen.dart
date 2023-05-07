import 'package:flutter/material.dart';
import 'input_screen.dart';
import 'bmi_status.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen(
      {Key? key,
      required this.bmi,
      required this.bestWeight,
      required this.bestMinWeight,
      required this.bestMaxWeight,
      required this.weight})
      : super(key: key);

  final double bmi;
  final double bestWeight;
  final double bestMinWeight;
  final double bestMaxWeight;
  final double weight;

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  // ignore: prefer_const_constructors
  TextStyle Style1 = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w500, color: Colors.grey[800]);
  TextStyle Style2 = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey[800]);

  @override
  Widget build(BuildContext context) {
    final bmiDescription = BMIDescription(widget.bestWeight,
        widget.bestMinWeight, widget.bestMaxWeight, widget.weight,
        bmi: widget.bmi);

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
                  'مؤشر كتلة الجسم هو',
                  style: Style1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: bmiDescription.getBMI(),
                ),
                Text(
                  bmiDescription.getStatus(),
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: bmiDescription.getStatusColors()),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Text(
                    'وزنك المناسب لطولك هو مابين'
                    ' ${widget.bestMinWeight.toStringAsFixed(1)}'
                    ' و ${widget.bestMaxWeight.toStringAsFixed(1)} كيلوجرام',
                    style: Style2,
                    textAlign: TextAlign.center,
                  ),
                ),
                // Text(
                //   ' ${widget.bestMinWeight.toStringAsFixed(2)}'
                //   ' and ${widget.bestMaxWeight.toStringAsFixed(2)}',
                //   style: Style2,
                // ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: bmiDescription.gainOrlose(),
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
            //alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        // ignore: prefer_const_constructors
                        builder: (context) => InputScreen()));
              },
              child: Container(
                width: 160,
                height: 50,
                child: const Center(child: Text('الخلف')),
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
