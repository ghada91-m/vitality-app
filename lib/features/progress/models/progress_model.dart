class ProgressModel {
  final double bmi;
  final String status;

  final int caloriesBurned;
  final int activeMinutes;

  final List<double> weightHistory;

  final int workoutsCompleted;
  final int workoutGoal;

  final int mealStreak;
  final int hydrationPercent;

  const ProgressModel({
    required this.bmi,
    required this.status,
    required this.caloriesBurned,
    required this.activeMinutes,
    required this.weightHistory,
    required this.workoutsCompleted,
    required this.workoutGoal,
    required this.mealStreak,
    required this.hydrationPercent,
  });
}