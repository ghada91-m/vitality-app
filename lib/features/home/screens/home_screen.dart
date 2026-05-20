import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

import '../widgets/home_header.dart';
import '../widgets/calories_circle.dart';
import '../widgets/quick_actions.dart';
import '../widgets/hydration_card.dart';
import '../widgets/macros_card.dart';
import '../widgets/health_stats.dart';
import '../widgets/today_meals.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      AppColors.background,

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),

          child: Column(

            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: const [

              HomeHeader(),

              SizedBox(height: 28),

              Center(
                child: CaloriesCircle(),
              ),

              SizedBox(height: 28),

              QuickActions(),

              SizedBox(height: 20),

              HydrationCard(),

              SizedBox(height: 18),

              MacrosCard(),

              SizedBox(height: 18),

              HealthStats(),

              SizedBox(height: 20),

              TodayMeals(),

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}