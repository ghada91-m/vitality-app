import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboarding_ai_scan.dart';
import 'onboarding_insights.dart';
import 'onboarding_get_started.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int currentIndex = 0;

  ///  NEXT
  void nextPage() async {
    if (currentIndex < 2) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('seenOnboarding', true);

      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  /// SKIP
  void skip() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenOnboarding', true);

    Navigator.pushReplacementNamed(context, '/login');
  }

  /// DOTS
  Widget dot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: currentIndex == index ? 18 : 7,
      height: 7,
      decoration: BoxDecoration(
        color: currentIndex == index
            ? const Color(0xFF0B7A3B)
            : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            ///  الصفحات
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                children: const [
                  OnboardingAIScanScreen(),
                  OnboardingInsightsScreen(),
                  OnboardingGetStartedScreen(),
                ],
              ),
            ),

            ///  dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                dot(0),
                dot(1),
                dot(2),
              ],
            ),

            const SizedBox(height: 20),

            ///  buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [

                  TextButton(
                    onPressed: skip,
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),

                  const Spacer(),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0B7A3B),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: nextPage,
                    child: Text(
                      currentIndex == 2 ? "Start" : "Next",
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}