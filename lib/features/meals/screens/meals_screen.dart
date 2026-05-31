import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

import '../models/meal_model.dart';
import '../widgets/meals_search_bar.dart';
import '../widgets/meal_action_card.dart';
import '../widgets/ai_scan_banner.dart';
import '../widgets/recent_meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<MealModel> meals = [

      MealModel(
        name: "Avocado Sourdough",
        calories: 370,
        image: "assets/images/avocado.png",
      ),

      MealModel(
        name: "Salmon Bowl",
        calories: 420,
        image: "assets/images/salmon.png",
      ),

      MealModel(
        name: "Healthy Salad",
        calories: 280,
        image: "assets/images/avocado.png",
      ),
    ];

    return Scaffold(

      backgroundColor: AppColors.background,

      body: SafeArea(

        child: Padding(

          padding: const EdgeInsets.all(20),

          child: Column(

            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              const SizedBox(height: 10),

              const Text(

                "What are you eating?",

                style: TextStyle(

                  fontSize: 28,

                  fontWeight:
                  FontWeight.w700,

                  color:
                  AppColors.textDark,
                ),
              ),

              const SizedBox(height: 20),

              const MealsSearchBar(),

              const SizedBox(height: 20),

              Row(

                children: [

                  Expanded(

                    child: MealActionCard(

                      icon:
                      Icons.qr_code_scanner,

                      title:
                      "Barcode Scanner",

                      subtitle:
                      "Instant entry",
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(

                    child: MealActionCard(

                      icon:
                      Icons.edit_note,

                      title:
                      "Add Meal",

                      subtitle:
                      "Custom details",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              const AiScanBanner(),

              const SizedBox(height: 24),

              Row(

                children: [

                  const Text(

                    "Recently Added",

                    style: TextStyle(

                      fontSize: 18,

                      fontWeight:
                      FontWeight.w700,
                    ),
                  ),

                  const Spacer(),

                  TextButton(

                    onPressed: () {},

                    child: const Text(
                      "Clear All",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Expanded(

                child: ListView.separated(

                  itemCount:
                  meals.length,

                  separatorBuilder:
                      (_, __) =>
                  const SizedBox(
                      height: 12),

                  itemBuilder:
                      (context, index) {

                    return RecentMealItem(
                      meal: meals[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}