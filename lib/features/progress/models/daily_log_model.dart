class DailyLogModel {
  final int waterCups;
  final int steps;
  final double sleepHours;
  final int totalCalories;

  const DailyLogModel({
    required this.waterCups,
    required this.steps,
    required this.sleepHours,
    required this.totalCalories,
  });

  factory DailyLogModel.fromJson(Map<String, dynamic> json) {
    return DailyLogModel(
      waterCups: _toInt(json['waterCups']),
      steps: _toInt(json['steps']),
      sleepHours: _toDouble(json['sleepHours']),
      totalCalories: _toInt(json['totalCaloriesFromMeals']),
    );
  }

  static int _toInt(dynamic value) {
    if (value == null) return 0;
    return int.tryParse(value.toString()) ?? 0;
  }

  static double _toDouble(dynamic value) {
    if (value == null) return 0;
    return double.tryParse(value.toString()) ?? 0;
  }
}