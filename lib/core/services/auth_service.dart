import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_user_model.dart';
import 'api_endpoints.dart';
import 'api_service.dart';

class AuthService {

  final ApiService _apiService =
  ApiService();

  /// REGISTER
  Future<AuthUserModel> register({

    required String userName,
    required String email,
    required String password,
    required int age,

  }) async {

    try {

      final response =
      await _apiService.dio.post(

        ApiEndpoints.register,

        data: {

          'userName': userName,
          'email': email,
          'password': password,
          'age': age,
        },
      );

      final user =
      AuthUserModel.fromJson(
          response.data);

      await _saveToken(user.token);

      return user;

    } on DioException catch (e) {

      throw Exception(
        e.response?.data ??
            'Register Failed',
      );
    }
  }

  /// LOGIN
  Future<AuthUserModel> login({

    String? email,
    String? userName,
    required String password,

  }) async {

    try {

      final response =
      await _apiService.dio.post(

        ApiEndpoints.login,

        data: {

          'email': email,
          'userName': userName,
          'password': password,
        },
      );

      final user =
      AuthUserModel.fromJson(
          response.data);

      await _saveToken(user.token);

      return user;

    } on DioException catch (e) {

      throw Exception(
        e.response?.data ??
            'Login Failed',
      );
    }
  }

  /// SAVE TOKEN
  Future<void> _saveToken(
      String token) async {

    final prefs =
    await SharedPreferences
        .getInstance();

    await prefs.setString(
      'token',
      token,
    );
  }

  /// LOGOUT
  Future<void> logout() async {

    final prefs =
    await SharedPreferences
        .getInstance();

    await prefs.clear();
  }
}