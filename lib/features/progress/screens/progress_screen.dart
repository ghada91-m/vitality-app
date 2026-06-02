import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/provider/progress_provider.dart';
import '../models/progress_model.dart';
import '../widgets/bmi_card.dart';
import '../widgets/goal_progress_card.dart';
import '../widgets/health_score_card.dart';
import '../widgets/weight_chart.dart';
import '../widgets/week_review_card.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProgressProvider>().loadProgress();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Consumer<ProgressProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading || provider.progress == null) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            }

            final progress = provider.progress!;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Your Progress",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: AppColors.textDark,
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    "Tracking your journey to a healthier you.",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textLight,
                    ),
                  ),

                  const SizedBox(height: 24),

                  HealthScoreCard(
                    score: progress.healthScore,
                  ),

                  const SizedBox(height: 16),

                  BmiCard(
                    bmi: progress.bmi,
                    status: progress.status,
                    healthScore: progress.healthScore,
                  ),

                  const SizedBox(height: 16),

                  GoalProgressCard(
                    currentWeight: progress.currentWeight,
                    targetWeight: progress.targetWeight,
                    progress: progress.weightGoalProgress,
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: _ProgressStatCard(
                          icon: Icons.local_fire_department_rounded,
                          title: "Calories",
                          current: progress.caloriesBurned,
                          goal: progress.caloriesGoal,
                          unit: "kcal",
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: _ProgressStatCard(
                          icon: Icons.timer_rounded,
                          title: "Activity",
                          current: progress.activeMinutes,
                          goal: progress.activeMinutesGoal,
                          unit: "min",
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  _WeightTrendSection(
                    progress: progress,
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "AI Health Coach",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: AppColors.textDark,
                    ),
                  ),

                  const SizedBox(height: 12),

                  _InsightCard(
                    text: _getInsight(progress),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Week in Review",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: AppColors.textDark,
                    ),
                  ),

                  const SizedBox(height: 12),

                  WeekReviewCard(
                    workouts: progress.workoutsCompleted,
                    goal: progress.workoutGoal,
                    streak: progress.mealStreak,
                    hydration: progress.hydrationPercent.round(),                  ),

                  const SizedBox(height: 30),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  String _getInsight(ProgressModel progress) {
    if (progress.hydrationPercent < 70) {
      return "Your hydration level is below target. Try drinking more water today to support metabolism and energy.";
    }

    if (progress.workoutsCompleted >= progress.workoutGoal) {
      return "Excellent consistency! You achieved your workout goal this week. Keep balancing activity with recovery.";
    }

    if (progress.activeMinutes < progress.activeMinutesGoal) {
      return "You are close to your activity goal. A short walk can help improve your cardiovascular health.";
    }

    if (progress.status == "Underweight") {
      return "Your BMI is below the healthy range. Focus on nutrient-dense meals with enough protein and healthy carbs.";
    }

    if (progress.status == "Overweight" || progress.status == "Obese") {
      return "Your BMI is above the healthy range. A gradual calorie deficit with consistent activity is safer and more sustainable.";
    }

    return "Great job! Your BMI is within the healthy range. Keep your nutrition, activity, and hydration consistent.";
  }
}

class _ProgressStatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final int current;
  final int goal;
  final String unit;

  const _ProgressStatCard({
    required this.icon,
    required this.title,
    required this.current,
    required this.goal,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = goal == 0 ? 0 : (current / goal).clamp(0.0, 1.0);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.primary.withOpacity(0.12),
            child: Icon(
              icon,
              size: 20,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(height: 14),

          Text(
            title.toUpperCase(),
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AppColors.textLight,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            "$current / $goal $unit",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
          ),

          const SizedBox(height: 12),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              color: AppColors.primary,
              backgroundColor: AppColors.primary.withOpacity(0.12),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            "${(progress * 100).round()}% completed",
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textLight,
            ),
          ),
        ],
      ),
    );
  }
}

class _WeightTrendSection extends StatelessWidget {
  final ProgressModel progress;

  const _WeightTrendSection({
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final change = progress.weightChange;
    final changeText =
        "${change >= 0 ? "+" : ""}${change.toStringAsFixed(1)} kg this week";

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Weight Trend",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDark,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    changeText,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textLight,
                    ),
                  ),
                ],
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Week",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          WeightChart(
            weights: progress.weightHistory,
          ),
        ],
      ),
    );
  }
}

class _InsightCard extends StatelessWidget {
  final String text;

  const _InsightCard({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.auto_awesome_rounded,
            color: Colors.white,
            size: 22,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Personalized Health Insight",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}