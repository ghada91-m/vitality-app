import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/routes_name.dart';
import '../../../core/constants/app_keys.dart';
import '../../../core/validators/app_validator.dart';

import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_text_field.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {

  final _formKey =
  GlobalKey<FormState>();

  String email = '';

  String password = '';

  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      AppColors.background,

      body: SafeArea(

        child: SingleChildScrollView(

          child: Padding(

            padding:
            const EdgeInsets.symmetric(
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

                        color:
                        AppColors.primary,

                        borderRadius:
                        BorderRadius.circular(
                          28,
                        ),

                        boxShadow: [

                          BoxShadow(

                            color:
                            AppColors.primary
                                .withOpacity(
                              0.20,
                            ),

                            blurRadius: 28,

                            offset:
                            const Offset(
                              0,
                              14,
                            ),
                          ),
                        ],
                      ),

                      child: const Icon(

                        Icons.favorite,

                        color:
                        AppColors.white,

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

                        fontWeight:
                        FontWeight.w900,

                        color:
                        AppColors.textDark,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// SUBTITLE
                  const Center(

                    child: Text(

                      "Login to continue your wellness journey",

                      style: TextStyle(

                        color:
                        AppColors.textLight,

                        fontSize: 15,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// EMAIL LABEL
                  const Text(

                    "Email",

                    style: TextStyle(

                      fontWeight:
                      FontWeight.w700,

                      color:
                      AppColors.textDark,
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// EMAIL FIELD
                  AppTextField(

                    hint:
                    "Enter your email",

                    icon:
                    Icons.email_outlined,

                    keyboardType:
                    TextInputType
                        .emailAddress,

                    onChanged:
                        (value) {

                      email = value;
                    },

                    validator:
                    AppValidator
                        .validateEmail,
                  ),

                  const SizedBox(height: 24),

                  /// PASSWORD LABEL
                  const Text(

                    "Password",

                    style: TextStyle(

                      fontWeight:
                      FontWeight.w700,

                      color:
                      AppColors.textDark,
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// PASSWORD FIELD
                  AppTextField(

                    hint:
                    "Enter your password",

                    icon:
                    Icons.lock_outline,

                    obscureText:
                    obscurePassword,

                    validator:
                    AppValidator
                        .validatePassword,

                    onChanged:
                        (value) {

                      password = value;
                    },

                    suffixIcon:
                    IconButton(

                      onPressed: () {

                        setState(() {

                          obscurePassword =
                          !obscurePassword;
                        });
                      },

                      icon: Icon(

                        obscurePassword
                            ? Icons
                            .visibility_off
                            : Icons
                            .visibility,

                        color:
                        AppColors.textLight,
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  /// FORGOT PASSWORD
                  Align(

                    alignment:
                    Alignment.centerRight,

                    child: TextButton(

                      onPressed: () {

                        Navigator.pushNamed(

                          context,

                          RoutesName
                              .forgotPassword,
                        );
                      },

                      child: const Text(

                        "Forgot Password?",

                        style: TextStyle(

                          color:
                          AppColors.primary,

                          fontWeight:
                          FontWeight.w700,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// LOGIN BUTTON
                  AppButton(

                    text: "Login",

                    onPressed:
                        () async {

                      if (_formKey
                          .currentState!
                          .validate()) {

                        final prefs =
                        await SharedPreferences
                            .getInstance();

                        await prefs
                            .setString(

                          AppKeys.token,

                          '123',
                        );

                        Navigator
                            .pushReplacementNamed(

                          context,

                          RoutesName
                              .collectData,
                        );
                      }
                    },
                  ),

                  const SizedBox(height: 28),

                  /// SIGN UP
                  Row(

                    mainAxisAlignment:
                    MainAxisAlignment
                        .center,

                    children: [

                      const Text(

                        "Don't have an account? ",
                      ),

                      GestureDetector(

                        onTap: () {

                          Navigator
                              .pushNamed(

                            context,

                            RoutesName
                                .signup,
                          );
                        },

                        child: const Text(

                          "Sign Up",

                          style: TextStyle(

                            color:
                            AppColors.primary,

                            fontWeight:
                            FontWeight.w900,
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