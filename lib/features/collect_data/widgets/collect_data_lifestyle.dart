import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/storage/app_preferences.dart';

class CollectDataLifestyle
    extends StatefulWidget {

  const CollectDataLifestyle({
    super.key,
  });

  @override
  State<CollectDataLifestyle>
  createState() =>
      _CollectDataLifestyleState();
}

class _CollectDataLifestyleState
    extends State<CollectDataLifestyle> {

  String selectedLifestyle =
      "Moderately Active";

  @override
  void initState() {

    super.initState();

    /// LOAD SAVED LIFESTYLE
    selectedLifestyle =
        AppPreferences
            .getLifestyle();
  }

  /// DAILY CALORIES
  String get calories {

    switch (selectedLifestyle) {

      case "Sedentary":
        return "1,850";

      case "Very Active":
        return "2,750";

      default:
        return "2,300";
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

            "Lifestyle",

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

            "Select your daily activity level to personalize calorie calculations.",

            style: TextStyle(

              color:
              AppColors.textLight,

              fontSize: 13,

              height: 1.5,
            ),
          ),

          const SizedBox(height: 30),

          /// SEDENTARY
          lifestyleCard(

            title: "Sedentary",

            subtitle:
            "Little or no exercise.",

            icon:
            Icons.weekend_rounded,

            emoji: "🛋️",

            color:
            const Color(0xFFF3F4F6),
          ),

          const SizedBox(height: 16),

          /// MODERATE
          lifestyleCard(

            title:
            "Moderately Active",

            subtitle:
            "Exercise 3-5 days weekly.",

            icon:
            Icons.directions_walk_rounded,

            emoji: "🚶",

            color:
            const Color(0xFFEAF8EF),
          ),

          const SizedBox(height: 16),

          /// ACTIVE
          lifestyleCard(

            title: "Very Active",

            subtitle:
            "Hard exercise daily.",

            icon:
            Icons.fitness_center_rounded,

            emoji: "🔥",

            color:
            const Color(0xFFFFF3E8),
          ),

          const SizedBox(height: 26),

          /// CALORIES CARD
          Container(

            width: double.infinity,

            padding:
            const EdgeInsets.all(
              24,
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
                30,
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

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment
                  .start,

              children: [

                const Text(

                  "ESTIMATED DAILY CALORIES",

                  style: TextStyle(

                    color:
                    Colors.white70,

                    fontSize: 11,

                    fontWeight:
                    FontWeight.w900,

                    letterSpacing: 1,
                  ),
                ),

                const SizedBox(height: 14),

                Row(
                  children: [

                    Text(

                      calories,

                      style:
                      const TextStyle(

                        color:
                        Colors.white,

                        fontSize: 42,

                        fontWeight:
                        FontWeight.w900,
                      ),
                    ),

                    const SizedBox(width: 8),

                    const Padding(

                      padding:
                      EdgeInsets.only(
                        top: 10,
                      ),

                      child: Text(

                        "kcal",

                        style: TextStyle(

                          color:
                          Colors.white70,

                          fontWeight:
                          FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                const Text(

                  "Your activity level helps our AI estimate daily energy expenditure and nutrition targets.",

                  style: TextStyle(

                    color:
                    Colors.white70,

                    height: 1.5,

                    fontSize: 13,
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

  /// CARD
  Widget lifestyleCard({

    required String title,

    required String subtitle,

    required IconData icon,

    required String emoji,

    required Color color,

  }) {

    bool selected =
        selectedLifestyle == title;

    return GestureDetector(

      onTap: () {

        setState(() {

          selectedLifestyle = title;

          /// SAVE LIFESTYLE
          AppPreferences
              .setLifestyle(
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

                          fontWeight:
                          FontWeight.w900,

                          fontSize: 17,
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

                  decoration:
                  const BoxDecoration(

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