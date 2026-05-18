import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/routes_name.dart';
import '../../../core/validators/app_validator.dart';

import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_text_field.dart';

import '../../../core/services/auth_service.dart';

class SignupScreen extends StatefulWidget {

  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() =>
      _SignupScreenState();
}

class _SignupScreenState
    extends State<SignupScreen> {

  final _formKey =
  GlobalKey<FormState>();

  final AuthService _authService =
  AuthService();

  bool isChecked = false;

  bool obscurePassword = true;

  bool obscureConfirmPassword = true;

  final TextEditingController
  nameController =
  TextEditingController();

  final TextEditingController
  emailController =
  TextEditingController();

  final TextEditingController
  passwordController =
  TextEditingController();

  final TextEditingController
  confirmPasswordController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      AppColors.background,

      body: Stack(
        children: [

          /// TOP BACKGROUND
          Container(

            height: 240,

            decoration: BoxDecoration(

              gradient: LinearGradient(

                begin:
                Alignment.topCenter,

                end:
                Alignment.bottomCenter,

                colors: [

                  AppColors.primary
                      .withValues(
                    alpha: 0.12,
                  ),

                  AppColors.background,
                ],
              ),
            ),
          ),

          SafeArea(

            child: Padding(

              padding:
              const EdgeInsets
                  .symmetric(
                horizontal: 22,
              ),

              child:
              SingleChildScrollView(

                child: Form(

                  key: _formKey,

                  child: Column(

                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,

                    children: [

                      const SizedBox(
                        height: 12,
                      ),

                      /// HEADER
                      Row(
                        children: [

                          IconButton(

                            icon:
                            const Icon(

                              Icons
                                  .arrow_back,

                              color:
                              AppColors
                                  .primary,
                            ),

                            onPressed: () {
                              Navigator.pop(
                                context,
                              );
                            },
                          ),

                          const Spacer(),

                          const Text(

                            "Vitality",

                            style: TextStyle(

                              fontWeight:
                              FontWeight
                                  .w900,

                              color:
                              AppColors
                                  .primary,

                              fontSize:
                              18,
                            ),
                          ),

                          const Spacer(),

                          const SizedBox(
                            width: 40,
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 18,
                      ),

                      /// TITLE
                      const Text(

                        "Create Account",

                        style: TextStyle(

                          fontSize: 32,

                          fontWeight:
                          FontWeight
                              .w900,

                          color:
                          AppColors
                              .textDark,
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      const Text(

                        "Start your wellness journey with smart health tracking.",

                        style: TextStyle(

                          color:
                          AppColors
                              .textLight,

                          fontSize: 15,
                        ),
                      ),

                      const SizedBox(
                        height: 34,
                      ),

                      /// FULL NAME
                      const Text(

                        "FULL NAME",

                        style: TextStyle(

                          fontSize: 11,

                          fontWeight:
                          FontWeight.w700,

                          color:
                          AppColors
                              .textLight,
                        ),
                      ),

                      const SizedBox(
                        height: 8,
                      ),

                      AppTextField(

                        controller:
                        nameController,

                        hint:
                        "John Doe",

                        icon:
                        Icons
                            .person_outline,

                        validator:
                        AppValidator
                            .validateName,
                      ),

                      const SizedBox(
                        height: 22,
                      ),

                      /// EMAIL
                      const Text(

                        "EMAIL ADDRESS",

                        style: TextStyle(

                          fontSize: 11,

                          fontWeight:
                          FontWeight.w700,

                          color:
                          AppColors
                              .textLight,
                        ),
                      ),

                      const SizedBox(
                        height: 8,
                      ),

                      AppTextField(

                        controller:
                        emailController,

                        hint:
                        "example@email.com",

                        icon:
                        Icons
                            .email_outlined,

                        keyboardType:
                        TextInputType
                            .emailAddress,

                        validator:
                        AppValidator
                            .validateEmail,
                      ),

                      const SizedBox(
                        height: 22,
                      ),

                      /// PASSWORD
                      const Text(

                        "PASSWORD",

                        style: TextStyle(

                          fontSize: 11,

                          fontWeight:
                          FontWeight.w700,

                          color:
                          AppColors
                              .textLight,
                        ),
                      ),

                      const SizedBox(
                        height: 8,
                      ),

                      AppTextField(

                        controller:
                        passwordController,

                        hint:
                        "Enter password",

                        icon:
                        Icons
                            .lock_outline,

                        obscureText:
                        obscurePassword,

                        validator:
                        AppValidator
                            .validatePassword,

                        suffixIcon:
                        IconButton(

                          icon: Icon(

                            obscurePassword
                                ? Icons
                                .visibility_off
                                : Icons
                                .visibility,

                            color:
                            AppColors
                                .textLight,
                          ),

                          onPressed: () {

                            setState(() {

                              obscurePassword =
                              !obscurePassword;
                            });
                          },
                        ),
                      ),

                      const SizedBox(
                        height: 22,
                      ),

                      /// CONFIRM PASSWORD
                      const Text(

                        "CONFIRM PASSWORD",

                        style: TextStyle(

                          fontSize: 11,

                          fontWeight:
                          FontWeight.w700,

                          color:
                          AppColors
                              .textLight,
                        ),
                      ),

                      const SizedBox(
                        height: 8,
                      ),

                      AppTextField(

                        controller:
                        confirmPasswordController,

                        hint:
                        "Confirm password",

                        icon:
                        Icons
                            .lock_outline,

                        obscureText:
                        obscureConfirmPassword,

                        suffixIcon:
                        IconButton(

                          icon: Icon(

                            obscureConfirmPassword
                                ? Icons
                                .visibility_off
                                : Icons
                                .visibility,

                            color:
                            AppColors
                                .textLight,
                          ),

                          onPressed: () {

                            setState(() {

                              obscureConfirmPassword =
                              !obscureConfirmPassword;
                            });
                          },
                        ),

                        validator:
                            (value) {

                          if (value ==
                              null ||
                              value
                                  .isEmpty) {

                            return
                              "Confirm password";
                          }

                          if (value !=
                              passwordController
                                  .text) {

                            return
                              "Passwords do not match";
                          }

                          return null;
                        },
                      ),

                      const SizedBox(
                        height: 18,
                      ),

                      /// CHECKBOX
                      Container(

                        padding:
                        const EdgeInsets
                            .all(10),

                        decoration:
                        BoxDecoration(

                          color:
                          AppColors
                              .white,

                          borderRadius:
                          BorderRadius
                              .circular(
                            18,
                          ),
                        ),

                        child: Row(
                          children: [

                            Checkbox(

                              activeColor:
                              AppColors
                                  .primary,

                              value:
                              isChecked,

                              onChanged:
                                  (value) {

                                setState(() {

                                  isChecked =
                                  value!;
                                });
                              },
                            ),

                            const Expanded(

                              child: Text(

                                "I agree to the Terms of Service and Privacy Policy",

                                style:
                                TextStyle(
                                  fontSize:
                                  12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 24,
                      ),

                      /// SIGN UP BUTTON
                      AppButton(

                        text:
                        "Create Account",

                        onPressed:
                            () async {

                          if (_formKey
                              .currentState!
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

                            try {

                              await _authService.register(

                                userName:
                                nameController.text,

                                email:
                                emailController.text,

                                password:
                                passwordController.text,

                                age: 20,
                              );

                              if (!mounted) return;

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(

                                const SnackBar(

                                  content: Text(
                                    'Account Created Successfully',
                                  ),
                                ),
                              );

                              Navigator
                                  .pushReplacementNamed(

                                context,

                                RoutesName
                                    .collectData,
                              );

                            } catch (e) {

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(

                                SnackBar(

                                  content:
                                  Text(e.toString()),
                                ),
                              );
                            }
                          }
                        },
                      ),

                      const SizedBox(
                        height: 28,
                      ),

                      /// LOGIN
                      Row(

                        mainAxisAlignment:
                        MainAxisAlignment
                            .center,

                        children: [

                          const Text(

                            "Already have an account? ",
                          ),

                          GestureDetector(

                            onTap: () {

                              Navigator
                                  .pushReplacementNamed(

                                context,

                                RoutesName
                                    .login,
                              );
                            },

                            child:
                            const Text(

                              "Log in",

                              style:
                              TextStyle(

                                color:
                                AppColors
                                    .primary,

                                fontWeight:
                                FontWeight
                                    .w900,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 30,
                      ),
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
}