import 'dart:math';

import 'package:bmi_calculator/Constent_colors/const_colors.dart';
import 'package:bmi_calculator/WIDGETs/widget_containers.dart';
import 'package:bmi_calculator/home%20result/HomeResult.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/WIDGETs/iconContainer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import '../WIDGETs/minus_pluse.dart';

class HomeScreenCalculator extends StatefulWidget {
  const HomeScreenCalculator({Key? key}) : super(key: key);

  @override
  State<HomeScreenCalculator> createState() => _HomeScreenCalculatorState();
}

class _HomeScreenCalculatorState extends State<HomeScreenCalculator> {
  double heights = 180;
  int weigth = 65;
  int age = 20;

  void _resultHome() {
    double result = weigth / pow(heights / 100, 2);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => homeResult(
                  result: result,
                )));
  }

  int selectedGender = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI Calcultor"),
          backgroundColor: Color(0xff02061b),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: reUsebleCard(
                        selected: selectedGender == 1 ? true : false,
                        onpressed: () {
                          setState(() {
                            selectedGender = 1;
                          });
                        },
                        child: Center(
                          child: iconContainer(
                            iconData: FontAwesomeIcons.mars,
                            title: 'MALE',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: reUsebleCard(
                      selected: selectedGender == 2 ? true : false,
                      onpressed: () {
                        setState(() {
                          selectedGender = 2;
                        });
                      },
                      child: iconContainer(
                        iconData: FontAwesomeIcons.venus,
                        title: 'FEMALE',
                      ),
                    )),
                  ],
                ),
              ),
              Expanded(
                  child: reUsebleCard(
                child: Column(
                  children: [
                    Text(
                      'Hight',
                      style: TextStyle(fontSize: 35),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          // '$height',
                          heights.toInt().toString(),
                          style: TextStyle(
                              fontSize: 60, fontWeight: FontWeight.w700),
                        ),
                        Text("cm", style: TextStyle(fontSize: 20))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                          inactiveTrackColor: Colors.grey,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 16)),
                      child: Slider(
                          value: heights,
                          min: 10,
                          max: 310,
                          onChanged: (newVlue) {
                            heights = newVlue;
                            setState(() {});
                          }),
                    )
                  ],
                ),
              )),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: reUsebleCard(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Text(
                              'Weight(kg)',
                              style: TextStyle(fontSize: 25),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  weigth.toString(),
                                  style: TextStyle(
                                      fontSize: 60,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                minus_pluse(
                                  onPressed: () => setState(() => weigth--),
                                  iconData: Icons.remove,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                minus_pluse(
                                  onPressed: () {
                                    setState(() {
                                      weigth++;
                                    });
                                  },
                                  iconData: Icons.add,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
                    Expanded(
                        child: reUsebleCard(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Text(
                              'Age(years)',
                              style: TextStyle(fontSize: 25),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  '$age', //default string
                                  style: TextStyle(
                                      fontSize: 60,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                minus_pluse(
                                  onPressed: () => setState(() => age--),
                                  iconData: Icons.remove,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                minus_pluse(
                                  onPressed: () => setState(() => age++),
                                  iconData: Icons.add,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              CustomButton(
                onpressed: _resultHome,
              )
            ],
          ),
        ));
  }
}

class CustomButton extends StatelessWidget {
  final Function() onpressed;
  final String? title;
  const CustomButton({Key? key, required this.onpressed, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: KButtonColor,
      onPressed: onpressed,
      child: Text(
        title ?? 'Calculate',
        style: TextStyle(fontSize: 40, color: Colors.white),
      ),
      constraints: BoxConstraints.tightFor(
        width: double.infinity,
        height: 56,
      ),
    );
  }
}
