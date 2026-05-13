import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/storage/app_preferences.dart';

class CollectDataGoal
    extends StatefulWidget {

  const CollectDataGoal({
    super.key,
  });

  @override
  State<CollectDataGoal> createState() =>
      _CollectDataGoalState();
}

class _CollectDataGoalState
    extends State<CollectDataGoal> {

  String selectedGoal = "Maintain";

  @override
  void initState() {

    super.initState();

    /// LOAD SAVED GOAL
    selectedGoal =
        AppPreferences.getGoal();
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(

      padding:
      const EdgeInsets.symmetric(
        horizontal: 22,
      ),

      child: Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          const SizedBox(height: 12),

          /// TITLE
          const Text(

            "The North Star",

            style: TextStyle(

              color:
              AppColors.textDark,

              fontSize: 30,

              fontWeight:
              FontWeight.w900,
            ),
          ),

          const SizedBox(height: 8),

          /// DESCRIPTION
          const Text(

            "Choose your primary focus for the next 90 days.",

            style: TextStyle(

              color:
              AppColors.textLight,

              height: 1.5,

              fontSize: 13,
            ),
          ),

          const SizedBox(height: 30),

          /// LOSE
          goalCard(

            title: "Lose weight",

            subtitle:
            "Focus on fat loss and metabolic health.",

            icon:
            Icons.trending_down_rounded,

            color:
            const Color(0xFFFFF2EF),

            emoji: "🔥",
          ),

          const SizedBox(height: 16),

          /// MAINTAIN
          goalCard(

            title: "Maintain",

            subtitle:
            "Optimize energy and steady-state vitality.",

            icon:
            Icons.balance_rounded,

            color:
            const Color(0xFFEAF8EF),

            emoji: "⚡",
          ),

          const SizedBox(height: 16),

          /// GAIN
          goalCard(

            title: "Gain weight",

            subtitle:
            "Prioritize muscle growth and strength gains.",

            icon:
            Icons.fitness_center_rounded,

            color:
            const Color(0xFFFFF9E7),

            emoji: "💪",
          ),

          const SizedBox(height: 26),

          /// AI INSIGHT CARD
          Container(

            width: double.infinity,

            padding:
            const EdgeInsets.all(
              22,
            ),

            decoration: BoxDecoration(

              gradient:
              LinearGradient(

                colors: [

                  AppColors.primary,

                  AppColors.primary
                      .withValues(
                    alpha: 0.85,
                  ),
                ],
              ),

              borderRadius:
              BorderRadius.circular(
                28,
              ),

              boxShadow: [

                BoxShadow(

                  color:
                  AppColors.primary
                      .withValues(
                    alpha: 0.20,
                  ),

                  blurRadius: 20,

                  offset:
                  const Offset(
                    0,
                    10,
                  ),
                ),
              ],
            ),

            child: Row(
              children: [

                Container(

                  width: 56,

                  height: 56,

                  decoration: BoxDecoration(

                    color: Colors.white
                        .withValues(
                      alpha: 0.18,
                    ),

                    borderRadius:
                    BorderRadius.circular(
                      18,
                    ),
                  ),

                  child: const Icon(

                    Icons.auto_awesome,

                    color: Colors.white,

                    size: 28,
                  ),
                ),

                const SizedBox(width: 18),

                const Expanded(

                  child: Column(

                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,

                    children: [

                      Text(

                        "AI Recommendation",

                        style: TextStyle(

                          color:
                          Colors.white,

                          fontSize: 15,

                          fontWeight:
                          FontWeight.w900,
                        ),
                      ),

                      SizedBox(height: 6),

                      Text(

                        "Your selected goal will personalize calories, meal plans, and progress tracking.",

                        style: TextStyle(

                          color:
                          Colors.white70,

                          height: 1.5,

                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  /// GOAL CARD
  Widget goalCard({

    required String title,

    required String subtitle,

    required IconData icon,

    required Color color,

    required String emoji,

  }) {

    bool selected =
        selectedGoal == title;

    return GestureDetector(

      onTap: () {

        setState(() {

          selectedGoal = title;

          /// SAVE GOAL
          AppPreferences.setGoal(
            title,
          );
        });
      },

      child: AnimatedContainer(

        duration:
        const Duration(
          milliseconds: 280,
        ),

        curve: Curves.easeInOut,

        width: double.infinity,

        padding:
        const EdgeInsets.all(20),

        decoration: BoxDecoration(

          color: AppColors.white,

          borderRadius:
          BorderRadius.circular(
            28,
          ),

          border: Border.all(

            color: selected
                ? AppColors.primary
                : Colors.transparent,

            width: 1.6,
          ),

          boxShadow: [

            BoxShadow(

              color: selected
                  ? AppColors.primary
                  .withValues(
                alpha: 0.10,
              )
                  : Colors.black
                  .withValues(
                alpha: 0.03,
              ),

              blurRadius: 20,

              offset:
              const Offset(0, 10),
            ),
          ],
        ),

        child: Stack(
          children: [

            Row(
              children: [

                /// ICON
                Container(

                  width: 58,

                  height: 58,

                  decoration: BoxDecoration(

                    color: color,

                    borderRadius:
                    BorderRadius.circular(
                      20,
                    ),
                  ),

                  child: Stack(
                    alignment:
                    Alignment.center,

                    children: [

                      Icon(

                        icon,

                        color:
                        AppColors.primary,

                        size: 28,
                      ),

                      Positioned(

                        top: 5,

                        right: 5,

                        child: Text(
                          emoji,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 18),

                /// TEXT
                Expanded(

                  child: Column(

                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,

                    children: [

                      Text(

                        title,

                        style: const TextStyle(

                          color:
                          AppColors.textDark,

                          fontSize: 17,

                          fontWeight:
                          FontWeight.w900,
                        ),
                      ),

                      const SizedBox(height: 7),

                      Text(

                        subtitle,

                        style: const TextStyle(

                          color:
                          AppColors.textLight,

                          fontSize: 12,

                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            /// CHECK
            if (selected)

              Positioned(

                top: 0,

                right: 0,

                child: Container(

                  width: 26,

                  height: 26,

                  decoration: const BoxDecoration(

                    color:
                    AppColors.primary,

                    shape:
                    BoxShape.circle,
                  ),

                  child: const Icon(

                    Icons.check,

                    color: Colors.white,

                    size: 16,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}