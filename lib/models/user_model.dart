class UserModel {
  final String name;
  final String email;
  final String gender;
  final int age;
  final double height;
  final double weight;
  final String goal;
  final String lifestyle;
  final String imagePath;

  const UserModel({
    required this.name,
    required this.email,
    required this.gender,
    required this.age,
    required this.height,
    required this.weight,
    required this.goal,
    required this.lifestyle,
    required this.imagePath,
  });

  /// COPY WITH
  UserModel copyWith({
    String? name,
    String? email,
    String? gender,
    int? age,
    double? height,
    double? weight,
    String? goal,
    String? lifestyle,
    String? imagePath,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      goal: goal ?? this.goal,
      lifestyle: lifestyle ?? this.lifestyle,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  /// TO MAP
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'gender': gender,
      'age': age,
      'height': height,
      'weight': weight,
      'goal': goal,
      'lifestyle': lifestyle,
      'imagePath': imagePath,
    };
  }

  /// FROM MAP
  factory UserModel.fromMap(
      Map<String, dynamic> map,
      ) {
    return UserModel(
      name: map['name'] ?? 'Ghada',
      email: map['email'] ?? 'ghada@email.com',
      gender: map['gender'] ?? 'Female',
      age: map['age'] ?? 25,
      height: (map['height'] ?? 170).toDouble(),
      weight: (map['weight'] ?? 65).toDouble(),
      goal: map['goal'] ?? 'Maintain Weight',
      lifestyle: map['lifestyle'] ?? 'Moderately Active',
      imagePath: map['imagePath'] ?? '',
    );
  }
}