import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/routes_name.dart';
import '../../../core/constants/app_keys.dart';
import '../../../core/validators/app_validator.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final _formKey = GlobalKey<FormState>();

  bool isChecked = false;

  bool obscurePassword = true;

  bool obscureConfirmPassword = true;

  final TextEditingController nameController =
  TextEditingController();

  final TextEditingController emailController =
  TextEditingController();

  final TextEditingController passwordController =
  TextEditingController();

  final TextEditingController confirmPasswordController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppColors.background,

      body: Stack(
        children: [

          /// TOP BACKGROUND
          Container(

            height: 240,

            decoration: BoxDecoration(

              gradient: LinearGradient(

                begin: Alignment.topCenter,

                end: Alignment.bottomCenter,

                colors: [

                  AppColors.primary
                      .withValues(alpha: 0.12),

                  AppColors.background,
                ],
              ),
            ),
          ),

          SafeArea(

            child: Padding(

              padding: const EdgeInsets.symmetric(
                horizontal: 22,
              ),

              child: SingleChildScrollView(

                child: Form(

                  key: _formKey,

                  child: Column(

                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      const SizedBox(height: 12),

                      /// HEADER
                      Row(
                        children: [

                          IconButton(

                            icon: const Icon(
                              Icons.arrow_back,
                              color: AppColors.primary,
                            ),

                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),

                          const Spacer(),

                          const Text(

                            "Vitality",

                            style: TextStyle(

                              fontWeight: FontWeight.w900,

                              color: AppColors.primary,

                              fontSize: 18,
                            ),
                          ),

                          const Spacer(),

                          const SizedBox(width: 40),
                        ],
                      ),

                      const SizedBox(height: 18),

                      /// TITLE
                      const Text(

                        "Create Account",

                        style: TextStyle(

                          fontSize: 32,

                          fontWeight: FontWeight.w900,

                          color: AppColors.textDark,
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(

                        "Start your wellness journey with smart health tracking.",

                        style: TextStyle(

                          color: AppColors.textLight,

                          fontSize: 15,
                        ),
                      ),

                      const SizedBox(height: 34),

                      /// FULL NAME
                      buildField(

                        label: "FULL NAME",

                        hint: "John Doe",

                        controller: nameController,

                        icon: Icons.person_outline,

                        validator:
                        AppValidator.validateName,
                      ),

                      const SizedBox(height: 22),

                      /// EMAIL
                      buildField(

                        label: "EMAIL ADDRESS",

                        hint: "example@email.com",

                        controller: emailController,

                        icon: Icons.email_outlined,

                        validator:
                        AppValidator.validateEmail,
                      ),

                      const SizedBox(height: 22),

                      /// PASSWORD
                      buildPasswordField(

                        label: "PASSWORD",

                        hint: "Enter password",

                        controller: passwordController,

                        obscureText: obscurePassword,

                        onToggle: () {

                          setState(() {

                            obscurePassword =
                            !obscurePassword;
                          });
                        },

                        validator:
                        AppValidator.validatePassword,
                      ),

                      const SizedBox(height: 22),

                      /// CONFIRM PASSWORD
                      buildPasswordField(

                        label: "CONFIRM PASSWORD",

                        hint: "Confirm password",

                        controller:
                        confirmPasswordController,

                        obscureText:
                        obscureConfirmPassword,

                        onToggle: () {

                          setState(() {

                            obscureConfirmPassword =
                            !obscureConfirmPassword;
                          });
                        },

                        validator: (value) {

                          if (value == null ||
                              value.isEmpty) {

                            return
                              "Confirm password";
                          }

                          if (value !=
                              passwordController.text) {

                            return
                              "Passwords do not match";
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 18),

                      /// CHECKBOX
                      Container(

                        padding: const EdgeInsets.all(10),

                        decoration: BoxDecoration(

                          color: AppColors.white,

                          borderRadius:
                          BorderRadius.circular(18),
                        ),

                        child: Row(
                          children: [

                            Checkbox(

                              activeColor:
                              AppColors.primary,

                              value: isChecked,

                              onChanged: (value) {

                                setState(() {

                                  isChecked = value!;
                                });
                              },
                            ),

                            const Expanded(

                              child: Text(

                                "I agree to the Terms of Service and Privacy Policy",

                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      /// SIGN UP BUTTON
                      SizedBox(

                        width: double.infinity,

                        height: 58,

                        child: ElevatedButton(

                          style:
                          ElevatedButton.styleFrom(

                            backgroundColor:
                            AppColors.primary,

                            foregroundColor:
                            AppColors.white,

                            elevation: 4,

                            shape:
                            RoundedRectangleBorder(

                              borderRadius:
                              BorderRadius.circular(20),
                            ),
                          ),

                          onPressed: () async {

                            if (_formKey.currentState!
                                .validate()) {

                              if (!isChecked) {

                                ScaffoldMessenger.of(
                                  context,
                                ).showSnackBar(

                                  const SnackBar(

                                    content: Text(
                                      "Accept terms first",
                                    ),
                                  ),
                                );

                                return;
                              }

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

                            "Create Account",

                            style: TextStyle(

                              fontWeight:
                              FontWeight.w800,

                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 28),

                      /// DIVIDER
                      Row(
                        children: const [

                          Expanded(
                            child: Divider(),
                          ),

                          Padding(

                            padding:
                            EdgeInsets.symmetric(
                              horizontal: 10,
                            ),

                            child: Text(
                              "or continue with",
                            ),
                          ),

                          Expanded(
                            child: Divider(),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      /// GOOGLE BUTTON
                      Container(

                        width: double.infinity,

                        padding:
                        const EdgeInsets.symmetric(
                          vertical: 16,
                        ),

                        decoration: BoxDecoration(

                          color: AppColors.white,

                          borderRadius:
                          BorderRadius.circular(20),

                          border: Border.all(

                            color: Colors.grey.shade300,
                          ),
                        ),

                        child: const Center(

                          child: Row(

                            mainAxisAlignment:
                            MainAxisAlignment.center,

                            children: [

                              Icon(
                                Icons.g_mobiledata,
                                size: 32,
                              ),

                              SizedBox(width: 8),

                              Text(

                                "Continue with Google",

                                style: TextStyle(

                                  fontWeight:
                                  FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      /// LOGIN
                      Row(

                        mainAxisAlignment:
                        MainAxisAlignment.center,

                        children: [

                          const Text(
                            "Already have an account? ",
                          ),

                          GestureDetector(

                            onTap: () {

                              Navigator
                                  .pushReplacementNamed(

                                context,

                                RoutesName.login,
                              );
                            },

                            child: const Text(

                              "Log in",

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

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// NORMAL FIELD
  Widget buildField({

    required String label,

    required String hint,

    required TextEditingController controller,

    required IconData icon,

    required String? Function(String?) validator,

  }) {

    return Column(

      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        Text(

          label,

          style: const TextStyle(

            fontSize: 11,

            fontWeight: FontWeight.w700,

            color: AppColors.textLight,
          ),
        ),

        const SizedBox(height: 8),

        TextFormField(

          controller: controller,

          validator: validator,

          decoration: InputDecoration(

            hintText: hint,

            prefixIcon: Icon(icon),

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
        ),
      ],
    );
  }

  /// PASSWORD FIELD
  Widget buildPasswordField({

    required String label,

    required String hint,

    required TextEditingController controller,

    required bool obscureText,

    required VoidCallback onToggle,

    required String? Function(String?) validator,

  }) {

    return Column(

      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        Text(

          label,

          style: const TextStyle(

            fontSize: 11,

            fontWeight: FontWeight.w700,

            color: AppColors.textLight,
          ),
        ),

        const SizedBox(height: 8),

        TextFormField(

          controller: controller,

          validator: validator,

          obscureText: obscureText,

          decoration: InputDecoration(

            hintText: hint,

            prefixIcon:
            const Icon(Icons.lock_outline),

            suffixIcon: IconButton(

              icon: Icon(

                obscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),

              onPressed: onToggle,
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
        ),
      ],
    );
  }
}