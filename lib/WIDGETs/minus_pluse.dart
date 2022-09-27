import 'package:flutter/material.dart';

import '../Constent_colors/const_colors.dart';

class minus_pluse extends StatelessWidget {
  final IconData iconData;
  final Function()? onPressed;

  //constractor
  minus_pluse({required this.iconData, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(
        iconData,
        size: 40,
        color: Colors.white,
      ),
      fillColor: KButtonColor,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
    );
  }
}
