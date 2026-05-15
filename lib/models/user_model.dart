class UserModel {

  final String gender;

  final int age;

  final double height;

  final double weight;

  final String goal;

  final String lifestyle;

  const UserModel({

    required this.gender,

    required this.age,

    required this.height,

    required this.weight,

    required this.goal,

    required this.lifestyle,
  });

  /// COPY WITH
  UserModel copyWith({

    String? gender,

    int? age,

    double? height,

    double? weight,

    String? goal,

    String? lifestyle,

  }) {

    return UserModel(

      gender:
      gender ?? this.gender,

      age:
      age ?? this.age,

      height:
      height ?? this.height,

      weight:
      weight ?? this.weight,

      goal:
      goal ?? this.goal,

      lifestyle:
      lifestyle ?? this.lifestyle,
    );
  }

  /// TO MAP
  Map<String, dynamic> toMap() {

    return {

      'gender': gender,

      'age': age,

      'height': height,

      'weight': weight,

      'goal': goal,

      'lifestyle': lifestyle,
    };
  }

  /// FROM MAP
  factory UserModel.fromMap(
      Map<String, dynamic> map) {

    return UserModel(

      gender:
      map['gender'] ?? 'Female',

      age:
      map['age'] ?? 25,

      height:
      map['height'] ?? 170.0,

      weight:
      map['weight'] ?? 65.0,

      goal:
      map['goal'] ?? 'Maintain',

      lifestyle:
      map['lifestyle']
          ?? 'Moderately Active',
    );
  }
}