class ProfileModel {
  final double weightKg;
  final double heightCm;
  final double suggestedCalories;

  const ProfileModel({
    required this.weightKg,
    required this.heightCm,
    required this.suggestedCalories,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      weightKg: _toDouble(json['weightKg']),
      heightCm: _toDouble(json['heightCm']),
      suggestedCalories: _toDouble(json['suggestedCalories']),
    );
  }

  static double _toDouble(dynamic value) {
    if (value == null) return 0;
    return double.tryParse(value.toString()) ?? 0;
  }
}