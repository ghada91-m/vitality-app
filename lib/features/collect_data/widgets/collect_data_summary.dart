import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/storage/app_preferences.dart';

class CollectDataSummary
    extends StatelessWidget {

  const CollectDataSummary({
    super.key,
  });

  /// USER DATA
  double get height =>
      AppPreferences.getHeight();

  double get weight =>
      AppPreferences.getWeight();

  int get age =>
      AppPreferences.getAge();

  String get gender =>
      AppPreferences.getGender();

  String get goal =>
      AppPreferences.getGoal();

  String get lifestyle =>
      AppPreferences.getLifestyle();

  /// BMI
  double get bmi {

    double heightMeter =
        height / 100;

    return weight /
        (heightMeter * heightMeter);
  }

  /// IDEAL WEIGHT
  double get idealWeight {

    return (height - 100) * 0.9;
  }

  /// BMR
  double get bmr {

    if (gender == "Male") {

      return 10 * weight +
          6.25 * height -
          5 * age +
          5;
    }

    return 10 * weight +
        6.25 * height -
        5 * age -
        161;
  }

  /// DAILY CALORIES
  double get calories {

    switch (lifestyle) {

      case "Sedentary":
        return bmr * 1.2;

      case "Very Active":
        return bmr * 1.75;

      default:
        return bmr * 1.55;
    }
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

            "Ready to Begin",

            style: TextStyle(

              color:
              AppColors.textDark,

              fontSize: 30,

              fontWeight:
              FontWeight.w900,
            ),
          ),

          const SizedBox(height: 10),

          /// DESCRIPTION
          const Text(

            "Your personalized wellness journey is ready.",

            style: TextStyle(

              color:
              AppColors.textLight,

              fontSize: 13,

              height: 1.5,
            ),
          ),

          const SizedBox(height: 30),

          /// MAIN CARD
          Container(

            width: double.infinity,

            padding:
            const EdgeInsets.all(
              26,
            ),

            decoration: BoxDecoration(

              gradient:
              LinearGradient(

                colors: [

                  AppColors.primary,

                  AppColors.primary
                      .withValues(
                    alpha: 0.88,
                  ),
                ],
              ),

              borderRadius:
              BorderRadius.circular(
                32,
              ),

              boxShadow: [

                BoxShadow(

                  color:
                  AppColors.primary
                      .withValues(
                    alpha: 0.20,
                  ),

                  blurRadius: 24,

                  offset:
                  const Offset(0, 12),
                ),
              ],
            ),

            child: Column(

              children: [

                const Icon(

                  Icons.favorite,

                  color: Colors.white,

                  size: 62,
                ),

                const SizedBox(height: 18),

                const Text(

                  "AI nutrition insights are now tailored specifically for your body and lifestyle.",

                  textAlign:
                  TextAlign.center,

                  style: TextStyle(

                    color: Colors.white,

                    fontWeight:
                    FontWeight.w700,

                    height: 1.6,
                  ),
                ),

                const SizedBox(height: 28),

                /// GRID
                Row(
                  children: [

                    Expanded(

                      child: summaryCard(

                        title: "BMI",

                        value:
                        bmi
                            .toStringAsFixed(
                          1,
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(

                      child: summaryCard(

                        title: "BMR",

                        value:
                        bmr
                            .round()
                            .toString(),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Row(
                  children: [

                    Expanded(

                      child: summaryCard(

                        title:
                        "Ideal Weight",

                        value:
                        "${idealWeight.round()} kg",
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(

                      child: summaryCard(

                        title:
                        "Calories",

                        value:
                        "${calories.round()}",
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// GOAL
                Container(

                  width: double.infinity,

                  padding:
                  const EdgeInsets
                      .symmetric(

                    horizontal: 18,

                    vertical: 16,
                  ),

                  decoration: BoxDecoration(

                    color: Colors.white
                        .withValues(
                      alpha: 0.12,
                    ),

                    borderRadius:
                    BorderRadius.circular(
                      22,
                    ),
                  ),

                  child: Row(
                    children: [

                      const Icon(

                        Icons.flag,

                        color:
                        Colors.white,
                      ),

                      const SizedBox(width: 12),

                      Expanded(

                        child: Text(

                          "Goal: $goal",

                          style:
                          const TextStyle(

                            color:
                            Colors.white,

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

          const SizedBox(height: 24),

          /// AI NOTE
          Container(

            width: double.infinity,

            padding:
            const EdgeInsets.all(
              20,
            ),

            decoration: BoxDecoration(

              color: AppColors.white,

              borderRadius:
              BorderRadius.circular(
                28,
              ),

              boxShadow: [

                BoxShadow(

                  color: Colors.black
                      .withValues(
                    alpha: 0.03,
                  ),

                  blurRadius: 18,

                  offset:
                  const Offset(0, 8),
                ),
              ],
            ),

            child: const Row(
              children: [

                Icon(

                  Icons.auto_awesome,

                  color:
                  AppColors.primary,
                ),

                SizedBox(width: 12),

                Expanded(

                  child: Text(

                    "Your AI-powered wellness plan is now personalized and ready to track your progress.",

                    style: TextStyle(

                      color:
                      AppColors.textDark,

                      height: 1.5,
                    ),
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

  /// SUMMARY CARD
  Widget summaryCard({

    required String title,

    required String value,

  }) {

    return Container(

      padding:
      const EdgeInsets.symmetric(

        vertical: 18,
      ),

      decoration: BoxDecoration(

        color: Colors.white
            .withValues(
          alpha: 0.14,
        ),

        borderRadius:
        BorderRadius.circular(
          22,
        ),
      ),

      child: Column(
        children: [

          Text(

            value,

            style: const TextStyle(

              color: Colors.white,

              fontSize: 24,

              fontWeight:
              FontWeight.w900,
            ),
          ),

          const SizedBox(height: 6),

          Text(

            title,

            style: const TextStyle(

              color: Colors.white70,

              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}