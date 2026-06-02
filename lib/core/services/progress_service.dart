import '../../features/progress/models/progress_model.dart';
import '../storage/app_preferences.dart';
import 'health_service.dart';

class ProgressService {

  static Future<ProgressModel> getProgress() async {

    final user =
    AppPreferences.getUser();

    final bmi =
    HealthService.calculateBMI(
      height: user.height,
      weight: user.weight,
    );

    String status;

    if (bmi < 18.5) {
      status = "Underweight";
    } else if (bmi < 25) {
      status = "Healthy";
    } else if (bmi < 30) {
      status = "Overweight";
    } else {
      status = "Obese";
    }

    return ProgressModel(
      bmi: bmi,
      status: status,

      caloriesBurned: 1240,
      activeMinutes: 45,

      weightHistory: [
        66,
        66.2,
        66.1,
        65.9,
        65.5,
      ],

      workoutsCompleted: 5,
      workoutGoal: 7,

      mealStreak: 12,
      hydrationPercent: 85,
    );
  }
}