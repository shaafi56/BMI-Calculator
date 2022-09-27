import 'package:bmi_calculator/HomeScreenCalculator/HomeScreenCalculator.dart';
import 'package:bmi_calculator/WIDGETs/widget_containers.dart';
import 'package:flutter/material.dart';

class homeResult extends StatelessWidget {
  final double result;

  //constractor
  const homeResult({Key? key, required this.result}) : super(key: key);

  String note() {
    if (result > 0 && result < 18)
      return "you're in the underweight range";
    else if (result > 18 && result <= 24)
      return "you're in the healthy weight range";
    else if (result > 24 && result <= 29)
      return "you're in the overweight range";
    else
      return "you're in the obese range";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculation page'),
          backgroundColor: Colors.black12,
        ),
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'your result',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                    child: reUsebleCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text('result:💪   ${result.toStringAsFixed(1)}',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(note(),
                            style: TextStyle(
                                fontSize: 25, color: Colors.grey.shade100)),
                      ),
                    ],
                  ),
                )),
                CustomButton(
                  onpressed: () {
                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreenCalculator()));
                  },
                  title: 'Back Home',
                )
              ]),
        ));
  }
}
