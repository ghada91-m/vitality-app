import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../models/meal_model.dart';

class RecentMealItem extends StatelessWidget {

  final MealModel meal;

  const RecentMealItem({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),

      child: Row(
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              meal.image,
              width: 55,
              height: 55,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                Text(
                  meal.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  "${meal.calories} kcal",
                  style: const TextStyle(
                    color: AppColors.textLight,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.add_circle_outline,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }
}