import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/routes_name.dart';

import '../widgets/collect_data_personal.dart';
import '../widgets/collect_data_goal.dart';
import '../widgets/collect_data_lifestyle.dart';
import '../widgets/collect_data_summary.dart';

class CollectDataScreen extends StatefulWidget {

  const CollectDataScreen({super.key});

  @override
  State<CollectDataScreen> createState() =>
      _CollectDataScreenState();
}

class _CollectDataScreenState
    extends State<CollectDataScreen> {

  /// PAGE CONTROLLER
  final PageController controller =
  PageController();

  /// CURRENT PAGE
  int currentIndex = 0;

  /// NEXT PAGE
  void nextPage() {

    if (currentIndex < 3) {

      controller.nextPage(

        duration:
        const Duration(milliseconds: 350),

        curve: Curves.easeInOut,
      );

    } else {

      Navigator.pushReplacementNamed(

        context,

        RoutesName.home,
      );
    }
  }

  /// PREVIOUS PAGE
  void previousPage() {

    if (currentIndex > 0) {

      controller.previousPage(

        duration:
        const Duration(milliseconds: 350),

        curve: Curves.easeInOut,
      );

    } else {

      Navigator.pop(context);
    }
  }

  /// PROGRESS
  double get progress =>
      (currentIndex + 1) / 4;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      AppColors.background,

      body: SafeArea(

        child: Column(
          children: [

            /// HEADER
            Padding(

              padding:
              const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),

              child: Column(
                children: [

                  /// TOP BAR
                  Row(
                    children: [

                      IconButton(

                        onPressed:
                        previousPage,

                        icon: const Icon(

                          Icons.arrow_back,

                          color:
                          AppColors.textDark,
                        ),
                      ),

                      const Text(

                        "Vitality",

                        style: TextStyle(

                          color:
                          AppColors.primary,

                          fontWeight:
                          FontWeight.w900,

                          fontSize: 16,
                        ),
                      ),

                      const Spacer(),

                      const CircleAvatar(

                        radius: 17,

                        backgroundColor:
                        AppColors.primary,

                        child: Icon(

                          Icons.person,

                          color:
                          Colors.white,

                          size: 18,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  /// STEP TEXT
                  Row(
                    children: [

                      Text(

                        "STEP ${currentIndex + 1} OF 4",

                        style: const TextStyle(

                          color:
                          AppColors.primary,

                          fontSize: 10,

                          fontWeight:
                          FontWeight.w900,

                          letterSpacing: 1,
                        ),
                      ),

                      const Spacer(),

                      const Text(

                        "Personal Profile",

                        style: TextStyle(

                          color:
                          AppColors.textLight,

                          fontSize: 10,

                          fontWeight:
                          FontWeight.w700,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  /// PROGRESS BAR
                  ClipRRect(

                    borderRadius:
                    BorderRadius.circular(
                      20,
                    ),

                    child:
                    LinearProgressIndicator(

                      value: progress,

                      minHeight: 5,

                      backgroundColor:
                      AppColors.border,

                      valueColor:
                      const AlwaysStoppedAnimation(

                        AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// PAGES
            Expanded(

              child: PageView(

                controller: controller,

                physics:
                const NeverScrollableScrollPhysics(),

                onPageChanged: (index) {

                  setState(() {

                    currentIndex = index;
                  });
                },

                children: const [

                  /// PERSONAL
                  CollectDataPersonal(),

                  /// GOAL
                  CollectDataGoal(),

                  /// LIFESTYLE
                  CollectDataLifestyle(),

                  /// SUMMARY
                  CollectDataSummary(),
                ],
              ),
            ),

            /// BOTTOM BUTTON
            Padding(

              padding:
              const EdgeInsets.fromLTRB(
                20,
                0,
                20,
                24,
              ),

              child: Column(
                children: [

                  SizedBox(

                    width: double.infinity,

                    height: 58,

                    child: ElevatedButton(

                      style:
                      ElevatedButton.styleFrom(

                        backgroundColor:
                        AppColors.primary,

                        elevation: 4,

                        shape:
                        RoundedRectangleBorder(

                          borderRadius:
                          BorderRadius.circular(
                            22,
                          ),
                        ),
                      ),

                      onPressed: nextPage,

                      child: Text(

                        currentIndex == 3
                            ? "Finish"
                            : currentIndex == 1
                            ? "Continue to Lifestyle"
                            : "Continue",

                        style: const TextStyle(

                          color: Colors.white,

                          fontSize: 15,

                          fontWeight:
                          FontWeight.w900,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  GestureDetector(

                    onTap: () {

                      Navigator
                          .pushReplacementNamed(

                        context,

                        RoutesName.home,
                      );
                    },

                    child: const Text(

                      "Save and finish later",

                      style: TextStyle(

                        color:
                        AppColors.textLight,

                        fontSize: 12,

                        fontWeight:
                        FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}