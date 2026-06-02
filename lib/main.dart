import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// ROUTES
import 'core/constants/routes_name.dart';

/// STORAGE
import 'core/storage/app_preferences.dart';

/// PROVIDERS
import 'core/provider/progress_provider.dart';

/// ONBOARDING
import 'features/onboarding/screens/splash.dart';
import 'features/onboarding/screens/onboarding.dart';

/// AUTH
import 'features/registration/screens/login.dart';
import 'features/registration/screens/signup.dart';
import 'features/registration/screens/forget.dart';

/// COLLECT DATA
import 'features/collect_data/screens/collect_data_screen.dart';

/// MAIN NAVIGATION
import 'features/navigation/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppPreferences.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProgressProvider(),
        ),
      ],
      child: const VitalityApp(),
    ),
  );
}

class VitalityApp extends StatelessWidget {
  const VitalityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: RoutesName.splash,

      routes: {
        /// SPLASH
        RoutesName.splash: (context) =>
        const SplashScreen(),

        /// ONBOARDING
        RoutesName.onboarding: (context) =>
        const OnboardingScreen(),

        /// LOGIN
        RoutesName.login: (context) =>
        const LoginScreen(),

        /// SIGNUP
        RoutesName.signup: (context) =>
        const SignupScreen(),

        /// FORGOT PASSWORD
        RoutesName.forgotPassword: (context) =>
        const ForgotPasswordScreen(),

        /// COLLECT DATA
        RoutesName.collectData: (context) =>
        const CollectDataScreen(),

        /// HOME
        RoutesName.home: (context) =>
        const MainScreen(),
      },
    );
  }
}