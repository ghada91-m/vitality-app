import 'package:health/health.dart';

class FitnessService {

  static final Health health =
  Health();

  /// REQUEST PERMISSIONS
  static Future<bool>
  requestPermissions() async {

    final types = [

      HealthDataType.STEPS,
    ];

    final permissions = [

      HealthDataAccess.READ,
    ];

    bool granted =
    await health.requestAuthorization(
      types,
      permissions: permissions,
    );

    return granted;
  }

  /// GET TODAY STEPS
  static Future<int>
  getTodaySteps() async {

    final now = DateTime.now();

    final midnight = DateTime(

      now.year,
      now.month,
      now.day,
    );

    int? steps =
    await health.getTotalStepsInInterval(

      midnight,
      now,
    );

    return steps ?? 0;
  }
}