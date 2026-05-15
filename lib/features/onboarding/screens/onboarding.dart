import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/routes_name.dart';
import '../../../core/constants/app_keys.dart';

import '../../../core/widgets/app_button.dart';

import '../widget/onboarding_ai_scan.dart';
import '../widget/onboarding_insights.dart';
import '../widget/onboarding_get_started.dart';

class OnboardingScreen extends StatefulWidget {

  const OnboardingScreen({
    super.key,
  });

  @override
  State<OnboardingScreen> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState
    extends State<OnboardingScreen> {

  final PageController controller =
  PageController();

  int currentIndex = 0;

  /// NEXT
  void nextPage() async {

    if (currentIndex < 2) {

      controller.nextPage(

        duration:
        const Duration(
          milliseconds: 300,
        ),

        curve: Curves.ease,
      );

    } else {

      final prefs =
      await SharedPreferences
          .getInstance();

      await prefs.setBool(

        AppKeys.seenOnboarding,

        true,
      );

      Navigator.pushReplacementNamed(

        context,

        RoutesName.login,
      );
    }
  }

  /// SKIP
  void skip() async {

    final prefs =
    await SharedPreferences
        .getInstance();

    await prefs.setBool(

      AppKeys.seenOnboarding,

      true,
    );

    Navigator.pushReplacementNamed(

      context,

      RoutesName.login,
    );
  }

  /// DOTS
  Widget dot(int index) {

    return AnimatedContainer(

      duration:
      const Duration(
        milliseconds: 300,
      ),

      margin:
      const EdgeInsets.symmetric(
        horizontal: 4,
      ),

      width:
      currentIndex == index
          ? 18
          : 7,

      height: 7,

      decoration: BoxDecoration(

        color:
        currentIndex == index

            ? AppColors.primary

            : Colors.grey.shade300,

        borderRadius:
        BorderRadius.circular(
          10,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      AppColors.background,

      body: SafeArea(

        child: Column(
          children: [

            /// PAGES
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

            /// DOTS
            Row(

              mainAxisAlignment:
              MainAxisAlignment.center,

              children: [

                dot(0),

                dot(1),

                dot(2),
              ],
            ),

            const SizedBox(height: 20),

            /// BUTTONS
            Padding(

              padding:
              const EdgeInsets.symmetric(
                horizontal: 20,
              ),

              child: Row(
                children: [

                  /// SKIP
                  TextButton(

                    onPressed: skip,

                    child: const Text(

                      "Skip",

                      style: TextStyle(

                        color:
                        AppColors.grey,

                        fontWeight:
                        FontWeight.w700,
                      ),
                    ),
                  ),

                  const Spacer(),

                  /// NEXT BUTTON
                  SizedBox(

                    width: 120,

                    child: AppButton(

                      text:
                      currentIndex == 2

                          ? "Start"

                          : "Next",

                      onPressed:
                      nextPage,

                      height: 50,
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