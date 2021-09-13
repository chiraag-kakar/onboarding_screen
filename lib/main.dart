import 'package:flutter/material.dart';
import 'package:onboarding_screen/widgets/boarding_screen.dart';
import 'dart:async';
import 'package:onboarding_screen/widgets/splash_screen_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
