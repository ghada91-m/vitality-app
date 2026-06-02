import 'package:dio/dio.dart';

import 'api_endpoints.dart';
import 'api_service.dart';

import '../../features/progress/models/daily_log_model.dart';
import '../../features/progress/models/profile_model.dart';
import '../../features/progress/models/progress_model.dart';

class ProgressService {
  static final Dio _dio = ApiService().dio;

  static Future<ProgressModel> getProgress() async {
    try {
      final responses = await Future.wait([
        _dio.get(ApiEndpoints.profile),
        _dio.get(ApiEndpoints.dailyLog),
      ]);

      final profile = ProfileModel.fromJson(
        responses[0].data as Map<String, dynamic>,
      );

      final dailyLog = DailyLogModel.fromJson(
        responses[1].data as Map<String, dynamic>,
      );

      final bmi = _calculateBmi(
        weightKg: profile.weightKg,
        heightCm: profile.heightCm,
      );

      final status = _getBmiStatus(bmi);

      final healthScore = _calculateHealthScore(
        bmi: bmi,
        waterCups: dailyLog.waterCups,
        steps: dailyLog.steps,
        sleepHours: dailyLog.sleepHours,
      );

      final hydrationPercent =
      ((dailyLog.waterCups / 8) * 100).clamp(0, 100).toDouble();

      return ProgressModel(
        bmi: bmi,
        status: status,
        healthScore: healthScore,

        waterCups: dailyLog.waterCups,
        steps: dailyLog.steps,
        sleepHours: dailyLog.sleepHours,

        caloriesConsumed: dailyLog.totalCalories,
        calorieGoal: profile.suggestedCalories.round(),

        currentWeight: profile.weightKg,
        targetWeight: profile.weightKg - 5,

        weightGoalProgress: 0.45,

        caloriesBurned: (dailyLog.steps * 0.04).round(),
        caloriesGoal: 700,

        activeMinutes: (dailyLog.steps / 100).round(),
        activeMinutesGoal: 60,

        workoutsCompleted: 4,
        workoutGoal: 5,

        mealStreak: 6,

        hydrationPercent: hydrationPercent,

        weightChange: -0.8,

        weightHistory: [
          WeightPoint(
            label: "Mon",
            weight: profile.weightKg + 0.8,
          ),
          WeightPoint(
            label: "Tue",
            weight: profile.weightKg + 0.6,
          ),
          WeightPoint(
            label: "Wed",
            weight: profile.weightKg + 0.4,
          ),
          WeightPoint(
            label: "Thu",
            weight: profile.weightKg + 0.3,
          ),
          WeightPoint(
            label: "Fri",
            weight: profile.weightKg + 0.2,
          ),
          WeightPoint(
            label: "Sat",
            weight: profile.weightKg + 0.1,
          ),
          WeightPoint(
            label: "Sun",
            weight: profile.weightKg,
          ),
        ],
      );
    } on DioException catch (e) {
      print('DIO ERROR: ${e.response?.data}');
      print('STATUS CODE: ${e.response?.statusCode}');
      rethrow;
    } catch (e, stackTrace) {
      print('ERROR: $e');
      print(stackTrace);
      rethrow;
    }
  }

  static double _calculateBmi({
    required double weightKg,
    required double heightCm,
  }) {
    if (weightKg <= 0 || heightCm <= 0) return 0;

    final heightM = heightCm / 100;
    return weightKg / (heightM * heightM);
  }

  static String _getBmiStatus(double bmi) {
    if (bmi == 0) return 'Incomplete';
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'Healthy';
    if (bmi < 30) return 'Overweight';
    return 'Obese';
  }

  static int _calculateHealthScore({
    required double bmi,
    required int waterCups,
    required int steps,
    required double sleepHours,
  }) {
    int score = 0;

    score += (bmi >= 18.5 && bmi <= 24.9) ? 30 : 15;

    score += ((waterCups / 8) * 25).round().clamp(0, 25);
    score += ((steps / 10000) * 25).round().clamp(0, 25);
    score += ((sleepHours / 8) * 20).round().clamp(0, 20);

    return score.clamp(0, 100);
  }
}