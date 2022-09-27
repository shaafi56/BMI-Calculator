import 'package:flutter/material.dart';

//Icon Container
class iconContainer extends StatelessWidget {
  final IconData iconData;
  final String title;

  //constractor class
  iconContainer({required this.iconData, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 80,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 25, color: Colors.white),
        )
      ],
    );
  }
}
