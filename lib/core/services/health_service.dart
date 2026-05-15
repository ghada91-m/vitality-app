class HealthService {

  /// BMI
  static double calculateBMI({

    required double height,

    required double weight,

  }) {

    double heightMeter =
        height / 100;

    return weight /
        (heightMeter * heightMeter);
  }

  /// IDEAL WEIGHT
  static double calculateIdealWeight({

    required double height,

  }) {

    return (height - 100) * 0.9;
  }

  /// BMR
  static double calculateBMR({

    required String gender,

    required double weight,

    required double height,

    required int age,

  }) {

    if (gender == "Male") {

      return
        10 * weight +
            6.25 * height -
            5 * age +
            5;
    }

    return
      10 * weight +
          6.25 * height -
          5 * age -
          161;
  }

  /// DAILY CALORIES
  static double calculateCalories({

    required String lifestyle,

    required double bmr,

  }) {

    switch (lifestyle) {

      case "Sedentary":
        return bmr * 1.2;

      case "Very Active":
        return bmr * 1.75;

      default:
        return bmr * 1.55;
    }
  }
}