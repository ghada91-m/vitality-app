import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import 'food_item_tile.dart';
import 'score_card.dart';

class NutritionCard extends StatelessWidget {
  const NutritionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          children: [

            const Expanded(
              child: Text(
                "Nutritional\nBreakdown",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight:
                  FontWeight.bold,
                ),
              ),
            ),

            Container(
              padding:
              const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),

              decoration: BoxDecoration(
                color:
                AppColors.lightGreen,

                borderRadius:
                BorderRadius.circular(20),
              ),

              child: const Text(
                "Recalibrate",
              ),
            ),
          ],
        ),

        const SizedBox(height: 18),

        Row(
          children: [

            Expanded(
              child: Container(
                padding:
                const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.circular(
                      24),
                ),

                child: const Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceAround,

                  children: [

                    _Macro(
                        value: "24g",
                        label: "Protein"),

                    _Macro(
                        value: "42g",
                        label: "Carbs"),

                    _Macro(
                        value: "12g",
                        label: "Fats"),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 12),

            const ScoreCard(),
          ],
        ),

        const SizedBox(height: 18),

        const FoodItemTile(
          title: "Baby Spinach",
          calories: "35 kcal",
        ),

        const SizedBox(height: 12),

        const FoodItemTile(
          title: "Cooked Quinoa",
          calories: "110 kcal",
        ),

        const SizedBox(height: 20),

        SizedBox(
          width: double.infinity,
          height: 58,

          child: ElevatedButton(
            onPressed: () {},

            style:
            ElevatedButton.styleFrom(
              backgroundColor:
              AppColors.primary,
            ),

            child: const Text(
              "Confirm & Add",
            ),
          ),
        ),
      ],
    );
  }
}

class _Macro extends StatelessWidget {
  final String value;
  final String label;

  const _Macro({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontWeight:
            FontWeight.bold,
          ),
        ),
        Text(label),
      ],
    );
  }
}