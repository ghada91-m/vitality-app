import 'package:flutter/material.dart';
import 'screens/splash.dart';
import 'screens/onboarding.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'screens/forget.dart';
import 'screens/home.dart'; // ⬅️ مهم

void main() {
  runApp(const VitalityApp());
}

class VitalityApp extends StatelessWidget {
  const VitalityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',

      routes: {
        '/splash': (context) => SplashScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/forgot': (context) => ForgotPasswordScreen(),
        '/home': (context) => HomeScreen(),
          },
    );
  }
}