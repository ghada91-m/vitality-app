import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class TodayMeals extends StatelessWidget {

  const TodayMeals({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(

      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        Row(

          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,

          children: const [

            Text(

              "Today's Meals",

              style: TextStyle(

                fontSize: 22,

                fontWeight:
                FontWeight.w800,
              ),
            ),

            Text(

              "See all",

              style: TextStyle(

                color:
                AppColors.primary,

                fontWeight:
                FontWeight.w600,
              ),
            ),
          ],
        ),

        const SizedBox(height: 18),

        const MealCard(

          image:
          "assets/images/avocado.png",

          title:
          "Avocado Toast & Egg",

          mealType:
          "BREAKFAST",

          calories:
          "320 kcal",

          protein:
          "24g Protein",

          carbs:
          "18g Carbs",

          aiScore:
          "92% Healthy",

          color:
          Color(0xffFFE6D8),
        ),

        SizedBox(height: 16),

        const MealCard(

          image:
          "assets/images/salmon.png",

          title:
          "Grilled Salmon Salad",

          mealType:
          "LUNCH",

          calories:
          "540 kcal",

          protein:
          "42g Protein",

          carbs:
          "26g Carbs",

          aiScore:
          "95% Balanced",

          color:
          Color(0xffDDF4E5),
        ),
      ],
    );
  }
}

class MealCard extends StatelessWidget {

  final String image;

  final String title;

  final String mealType;

  final String calories;

  final String protein;

  final String carbs;

  final String aiScore;

  final Color color;

  const MealCard({

    super.key,

    required this.image,

    required this.title,

    required this.mealType,

    required this.calories,

    required this.protein,

    required this.carbs,

    required this.aiScore,

    required this.color,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding:
      const EdgeInsets.all(16),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
        BorderRadius.circular(30),

        boxShadow: [

          BoxShadow(

            color:
            Colors.black.withValues(
              alpha: 0.04,
            ),

            blurRadius: 18,

            offset:
            const Offset(0, 10),
          ),
        ],
      ),

      child: Row(

        children: [

          /// IMAGE
          Container(

            width: 92,

            height: 92,

            decoration: BoxDecoration(

              color: color,

              borderRadius:
              BorderRadius.circular(24),
            ),

            child: Padding(

              padding:
              const EdgeInsets.all(12),

              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(width: 16),

          /// INFO
          Expanded(

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Row(

                  children: [

                    Container(

                      padding:
                      const EdgeInsets.symmetric(

                        horizontal: 10,
                        vertical: 5,
                      ),

                      decoration:
                      BoxDecoration(

                        color:
                        AppColors.lightGreen,

                        borderRadius:
                        BorderRadius.circular(
                          20,
                        ),
                      ),

                      child: Text(

                        mealType,

                        style: const TextStyle(

                          fontSize: 10,

                          fontWeight:
                          FontWeight.w700,

                          color:
                          AppColors.primary,
                        ),
                      ),
                    ),

                    const Spacer(),

                    const Icon(

                      Icons.more_horiz,

                      color: Colors.grey,
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Text(

                  title,

                  style: const TextStyle(

                    fontSize: 17,

                    fontWeight:
                    FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 10),

                Text(

                  calories,

                  style: const TextStyle(

                    color:
                    AppColors.primary,

                    fontWeight:
                    FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 12),

                Wrap(

                  spacing: 8,

                  runSpacing: 8,

                  children: [

                    _Chip(
                      label: protein,
                      color:
                      AppColors.primary,
                    ),

                    _Chip(
                      label: carbs,
                      color: Colors.orange,
                    ),

                    _Chip(
                      label: aiScore,
                      color: Colors.purple,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {

  final String label;

  final Color color;

  const _Chip({

    required this.label,

    required this.color,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding:
      const EdgeInsets.symmetric(

        horizontal: 10,
        vertical: 6,
      ),

      decoration: BoxDecoration(

        color:
        color.withValues(
          alpha: 0.10,
        ),

        borderRadius:
        BorderRadius.circular(20),
      ),

      child: Text(

        label,

        style: TextStyle(

          color: color,

          fontSize: 11,

          fontWeight:
          FontWeight.w700,
        ),
      ),
    );
  }
}