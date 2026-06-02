class ProgressModel {
  final double bmi;
  final String status;
  final int healthScore;

  final int waterCups;
  final int steps;
  final double sleepHours;

  final int caloriesConsumed;
  final int calorieGoal;

  final double currentWeight;
  final double targetWeight;
  final double weightGoalProgress;

  final int caloriesBurned;
  final int caloriesGoal;

  final int activeMinutes;
  final int activeMinutesGoal;

  final int workoutsCompleted;
  final int workoutGoal;

  final int mealStreak;
  final double hydrationPercent;

  final double weightChange;

  final List<WeightPoint> weightHistory;

  const ProgressModel({
    required this.bmi,
    required this.status,
    required this.healthScore,

    required this.waterCups,
    required this.steps,
    required this.sleepHours,

    required this.caloriesConsumed,
    required this.calorieGoal,

    required this.currentWeight,
    required this.targetWeight,
    required this.weightGoalProgress,

    required this.caloriesBurned,
    required this.caloriesGoal,

    required this.activeMinutes,
    required this.activeMinutesGoal,

    required this.workoutsCompleted,
    required this.workoutGoal,

    required this.mealStreak,
    required this.hydrationPercent,

    required this.weightChange,

    required this.weightHistory,
  });
}

class WeightPoint {
  final String label;
  final double weight;

  const WeightPoint({
    required this.label,
    required this.weight,
  });
}