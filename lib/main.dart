import 'package:flutter/material.dart';
import 'screens/splash.dart';

void main() {
  runApp(VitalityApp());
}

class VitalityApp extends StatelessWidget {
  const VitalityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), 
      
    );
  }
}