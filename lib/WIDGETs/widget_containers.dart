//waa widget kuu sahlaya inad hal meel wax ka badasho
//Extract widget

import 'package:bmi_calculator/Constent_colors/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/HomeScreenCalculator/HomeScreenCalculator.dart';

class reUsebleCard extends StatelessWidget {
  final Widget? child;
  final bool selected;
  final Function()? onpressed;

  //constractor class
  reUsebleCard({this.child, this.selected = false, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        child: child,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: selected == true ? KButtonColor : KActiveColors,
            borderRadius: BorderRadius.circular(13)),
      ),
    );
  }
}
