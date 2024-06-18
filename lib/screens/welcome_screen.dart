import 'package:bmi_calc_2/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'input_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocalProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                languageSelectionBox(context, provider),
                welcomBox(context),
              ],
            ),
            bottomBox(context)
          ],
        ),
      ),
    );
  }
}

languageSelectionBox(BuildContext context, LocalProvider provider) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
            onTap: () {
              provider.setLocale(const Locale('ar'));
            },
            child: const Text('العربية',
                style: TextStyle(color: Colors.blueAccent))),
        const Text(' | '),
        InkWell(
            onTap: () {
              provider.setLocale(const Locale('en'));
            },
            child: const Text(
              'English',
              style: TextStyle(color: Colors.blueAccent),
            )),
      ],
    ),
  );
}

welcomBox(BuildContext context) {
  return Container(
    color: Colors.grey[50],
    padding: const EdgeInsets.all(25),
    // ignore: prefer_const_literals_to_create_immutables
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Row(
          children: [
            Text(
              (AppLocalizations.of(context)!.greeting),
              style: const TextStyle(fontSize: 35),
            ),
            const Text(
              '👋🏼',
              style: TextStyle(fontSize: 35),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          (AppLocalizations.of(context)!.intro_message),
          // textDirection: TextDirection.rtl,
          // textAlign: TextAlign.right,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}
// 'هذا التطبيق سوف يساعدك على معرفة مؤشر كتلة جسمك وسوف يخبرك بالوزن المطلوب لتحقيق مؤشر الكتلة المثالي.'

bottomBox(BuildContext context) {
  const s1 = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);

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
                child: Center(
                    child: Text(
                  (AppLocalizations.of(context)!.start),
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
