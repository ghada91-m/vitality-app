import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/storage/app_preferences.dart';
import '../../../core/services/health_service.dart';

import '../widgets/home_header.dart';
import '../widgets/calories_circle.dart';
import '../widgets/quick_actions.dart';
import '../widgets/hydration_card.dart';
import '../widgets/macros_card.dart';
import '../widgets/health_stats.dart';
import '../widgets/today_meals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> {

  late int goalCalories;

  int eatenCalories = 420;

  int burnedCalories = 120;

  double sleepHours = 7.5;

  @override
  void initState() {
    super.initState();

    final user =
    AppPreferences.getUser();

    final bmr =
    HealthService.calculateBMR(
      gender: user.gender,
      weight: user.weight,
      height: user.height,
      age: user.age,
    );

    goalCalories =
        HealthService.calculateCalories(
          lifestyle: user.lifestyle,
          bmr: bmr,
        ).round();
  }

  int get remainingCalories {

    final remaining =
        goalCalories -
            eatenCalories +
            burnedCalories;

    return remaining < 0
        ? 0
        : remaining;
  }

  double get caloriesProgress {

    final progress =
        eatenCalories /
            goalCalories;

    return progress > 1
        ? 1
        : progress;
  }

  void addMealCalories() {

    setState(() {

      eatenCalories += 180;
    });
  }

  void removeMealCalories() {

    setState(() {

      if (eatenCalories >= 180) {

        eatenCalories -= 180;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      AppColors.background,

      body: SafeArea(

        child: SingleChildScrollView(

          padding:
          const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),

          child: Column(

            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              const HomeHeader(),

              const SizedBox(height: 26),

              Center(

                child: CaloriesCircle(

                  remainingCalories:
                  remainingCalories,

                  eatenCalories:
                  eatenCalories,

                  burnedCalories:
                  burnedCalories,

                  progress:
                  caloriesProgress,
                ),
              ),

              const SizedBox(height: 26),

              QuickActions(

                onAddMeal:
                addMealCalories,

                onRemoveMeal:
                removeMealCalories,
              ),

              const SizedBox(height: 20),

              const HydrationCard(),

              const SizedBox(height: 18),

              HealthStats(
                sleepHours: sleepHours,
                onSleepChanged:
                    (value) {

                  setState(() {

                    sleepHours =
                        value;
                  });
                },
              ),

              const SizedBox(height: 18),

              const MacrosCard(),

              const SizedBox(height: 20),

              const TodayMeals(),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}