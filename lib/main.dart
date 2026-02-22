import 'package:flutter/material.dart';
import 'package:fluttter_github/Stepper_Application.dart';
import 'package:fluttter_github/stepper_widget/stepper_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StepperApplication(),
    );
  }
}

