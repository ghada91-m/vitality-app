import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/routes_name.dart';
import '../../../core/constants/app_keys.dart';
import '../../../core/validators/app_validator.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();

  String email = '';

  String password = '';

  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppColors.background,

      body: SafeArea(

        child: SingleChildScrollView(

          child: Padding(

            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 30,
            ),

            child: Form(

              key: _formKey,

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  const SizedBox(height: 20),

                  /// LOGO
                  Center(
                    child: Container(

                      width: 90,

                      height: 90,

                      decoration: BoxDecoration(

                        color: AppColors.primary,

                        borderRadius:
                        BorderRadius.circular(28),

                        boxShadow: [

                          BoxShadow(

                            color: AppColors.primary
                                .withValues(alpha: 0.25),

                            blurRadius: 20,

                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),

                      child: const Icon(

                        Icons.favorite,

                        color: AppColors.white,

                        size: 42,
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  /// TITLE
                  const Center(
                    child: Text(

                      "Welcome Back",

                      style: TextStyle(

                        fontSize: 30,

                        fontWeight: FontWeight.w900,

                        color: AppColors.textDark,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// SUBTITLE
                  Center(
                    child: Text(

                      "Login to continue your wellness journey",

                      style: TextStyle(

                        color: AppColors.textLight,

                        fontSize: 15,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// EMAIL LABEL
                  const Text(

                    "Email",

                    style: TextStyle(

                      fontWeight: FontWeight.w700,

                      color: AppColors.textDark,
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// EMAIL FIELD
                  TextFormField(

                    keyboardType:
                    TextInputType.emailAddress,

                    decoration: InputDecoration(

                      hintText: "Enter your email",

                      hintStyle: const TextStyle(
                        color: AppColors.textLight,
                      ),

                      prefixIcon: const Icon(
                        Icons.email_outlined,
                      ),

                      filled: true,

                      fillColor: AppColors.white,

                      contentPadding:
                      const EdgeInsets.symmetric(
                        vertical: 18,
                      ),

                      border: OutlineInputBorder(

                        borderRadius:
                        BorderRadius.circular(18),

                        borderSide: BorderSide.none,
                      ),
                    ),

                    onChanged: (value) => email = value,

                    validator:
                    AppValidator.validateEmail,
                  ),

                  const SizedBox(height: 24),

                  /// PASSWORD LABEL
                  const Text(

                    "Password",

                    style: TextStyle(

                      fontWeight: FontWeight.w700,

                      color: AppColors.textDark,
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// PASSWORD FIELD
                  TextFormField(

                    obscureText: obscurePassword,

                    decoration: InputDecoration(

                      hintText: "Enter your password",

                      hintStyle: const TextStyle(
                        color: AppColors.textLight,
                      ),

                      prefixIcon: const Icon(
                        Icons.lock_outline,
                      ),

                      suffixIcon: IconButton(

                        onPressed: () {

                          setState(() {

                            obscurePassword =
                            !obscurePassword;
                          });
                        },

                        icon: Icon(

                          obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),

                      filled: true,

                      fillColor: AppColors.white,

                      contentPadding:
                      const EdgeInsets.symmetric(
                        vertical: 18,
                      ),

                      border: OutlineInputBorder(

                        borderRadius:
                        BorderRadius.circular(18),

                        borderSide: BorderSide.none,
                      ),
                    ),

                    onChanged: (value) =>
                    password = value,

                    validator:
                    AppValidator.validatePassword,
                  ),

                  const SizedBox(height: 14),

                  /// FORGOT PASSWORD
                  Align(

                    alignment: Alignment.centerRight,

                    child: TextButton(

                      onPressed: () {

                        Navigator.pushNamed(

                          context,

                          RoutesName.forgotPassword,
                        );
                      },

                      child: const Text(

                        "Forgot Password?",

                        style: TextStyle(

                          color: AppColors.primary,

                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  /// LOGIN BUTTON
                  SizedBox(

                    width: double.infinity,

                    height: 58,

                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        backgroundColor:
                        AppColors.primary,

                        elevation: 0,

                        shape: RoundedRectangleBorder(

                          borderRadius:
                          BorderRadius.circular(20),
                        ),
                      ),

                      onPressed: () async {

                        if (_formKey.currentState!
                            .validate()) {

                          final prefs =
                          await SharedPreferences
                              .getInstance();

                          await prefs.setString(
                            AppKeys.token,
                            '123',
                          );

                          Navigator
                              .pushReplacementNamed(

                            context,

                            RoutesName.home,
                          );
                        }
                      },

                      child: const Text(

                        "Login",

                        style: TextStyle(

                          fontSize: 17,

                          fontWeight: FontWeight.w800,

                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  /// SIGN UP
                  Row(

                    mainAxisAlignment:
                    MainAxisAlignment.center,

                    children: [

                      const Text(
                        "Don't have an account? ",
                      ),

                      GestureDetector(

                        onTap: () {

                          Navigator.pushNamed(

                            context,

                            RoutesName.signup,
                          );
                        },

                        child: const Text(

                          "Sign Up",

                          style: TextStyle(

                            color: AppColors.primary,

                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}