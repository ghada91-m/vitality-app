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
                FontWeight.bold,
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
          "320 KCAL",

          protein:
          "24g",

          carbs:
          "18g",

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
          "540 KCAL",

          protein:
          "42g",

          carbs:
          "26g",

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
  final Color color;

  const MealCard({

    super.key,

    required this.image,
    required this.title,
    required this.mealType,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
        BorderRadius.circular(28),

        boxShadow: [

          BoxShadow(

            color:
            Colors.black.withOpacity(0.04),

            blurRadius: 18,

            offset: const Offset(0, 10),
          ),
        ],
      ),

      child: Row(

        children: [

          /// IMAGE
          Container(

            width: 82,
            height: 82,

            decoration: BoxDecoration(

              color: color,

              borderRadius:
              BorderRadius.circular(22),
            ),

            child: Padding(

              padding:
              const EdgeInsets.all(10),

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

                Text(

                  mealType,

                  style: const TextStyle(

                    fontSize: 10,

                    color: Colors.grey,

                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(

                  title,

                  style: const TextStyle(

                    fontSize: 17,

                    fontWeight:
                    FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 10),

                Row(

                  children: [

                    _MacroChip(
                      label: protein,
                      color:
                      AppColors.primary,
                    ),

                    const SizedBox(width: 8),

                    _MacroChip(
                      label: carbs,
                      color: Colors.orange,
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// CALORIES
          Column(

            crossAxisAlignment:
            CrossAxisAlignment.end,

            children: [

              const Icon(

                Icons.more_horiz,

                color: Colors.grey,
              ),

              const SizedBox(height: 18),

              Text(

                calories,

                style: const TextStyle(

                  color:
                  AppColors.primary,

                  fontWeight:
                  FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MacroChip extends StatelessWidget {

  final String label;
  final Color color;

  const _MacroChip({

    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),

      decoration: BoxDecoration(

        color:
        color.withOpacity(0.12),

        borderRadius:
        BorderRadius.circular(20),
      ),

      child: Text(

        label,

        style: TextStyle(

          color: color,

          fontWeight:
          FontWeight.bold,

          fontSize: 11,
        ),
      ),
    );
  }
}