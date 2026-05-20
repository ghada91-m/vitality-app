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

                fontSize: 20,

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

        const _MealCard(

          title: "Avocado Toast & Egg",

          subtitle: "BREAKFAST",

          calories: "320 KCAL",

          color: Color(0xffFFE2D2),
        ),

        SizedBox(height: 14),

        const _MealCard(

          title: "Grilled Salmon Salad",

          subtitle: "LUNCH",

          calories: "540 KCAL",

          color: Color(0xffDDF4E4),
        ),
      ],
    );
  }
}

class _MealCard extends StatelessWidget {

  final String title;
  final String subtitle;
  final String calories;
  final Color color;

  const _MealCard({

    required this.title,
    required this.subtitle,
    required this.calories,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
        BorderRadius.circular(24),
      ),

      child: Row(

        children: [

          Container(

            width: 64,
            height: 64,

            decoration: BoxDecoration(

              color: color,

              borderRadius:
              BorderRadius.circular(18),
            ),

            child: const Icon(
              Icons.restaurant,
              size: 32,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(

                  subtitle,

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

                    fontSize: 16,

                    fontWeight:
                    FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

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
    );
  }
}