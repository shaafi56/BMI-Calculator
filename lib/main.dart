import 'package:flutter/material.dart';
import 'package:bmi_calculator/HomeScreenCalculator/HomeScreenCalculator.dart';
import 'package:bmi_calculator/splash screen/splash_screen.dart';
import 'package:flutter/services.dart';

void main() {
  //orientation or rotate mobile screen
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: Color(0xff02061b)),
      home: splashScreen(),
    );
  }
}
