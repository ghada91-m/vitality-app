import 'package:flutter/material.dart';

import 'core/constants/routes_name.dart';

import 'features/onboarding/screens/splash.dart';
import 'features/onboarding/screens/onboarding.dart';

import 'features/registration/screens/login.dart';
import 'features/registration/screens/signup.dart';
import 'features/registration/screens/forget.dart';

import 'screens/home.dart';

void main() {
  runApp(const VitalityApp());
}

class VitalityApp extends StatelessWidget {
  const VitalityApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      initialRoute: RoutesName.splash,

      routes: {

        RoutesName.splash: (context) =>
        const SplashScreen(),

        RoutesName.onboarding: (context) =>
        const OnboardingScreen(),

        RoutesName.login: (context) =>
        const LoginScreen(),

        RoutesName.signup: (context) =>
        const SignupScreen(),

        RoutesName.forgotPassword: (context) =>
        const ForgotPasswordScreen(),

        RoutesName.home: (context) =>
        const HomeScreen(),
      },
    );
  }
}