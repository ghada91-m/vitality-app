class AuthUserModel {

  final String token;
  final String expiresAtUtc;
  final String userName;
  final String email;
  final List<String> roles;

  AuthUserModel({
    required this.token,
    required this.expiresAtUtc,
    required this.userName,
    required this.email,
    required this.roles,
  });

  factory AuthUserModel.fromJson(
      Map<String, dynamic> json) {

    return AuthUserModel(

      token:
      json['token'] ?? '',

      expiresAtUtc:
      json['expiresAtUtc'] ?? '',

      userName:
      json['userName'] ?? '',

      email:
      json['email'] ?? '',

      roles:
      List<String>.from(
          json['roles'] ?? []),
    );
  }
}