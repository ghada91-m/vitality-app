import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/routes_name.dart';
import '../../../core/validators/app_validator.dart';

import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {

  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends State<ForgotPasswordScreen> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController =
  TextEditingController();

  /// SEND RESET LINK
  void sendResetLink() {

    if (!_formKey.currentState!.validate()) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(

      const SnackBar(

        content: Text(
          "Reset link sent successfully",
        ),

        backgroundColor:
        AppColors.primary,
      ),
    );

    Future.delayed(

      const Duration(seconds: 2),

          () {

        if (!mounted) return;

        Navigator.pushReplacementNamed(

          context,

          RoutesName.login,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      AppColors.background,

      body: Stack(
        children: [

          /// TOP GRADIENT
          Container(

            height: 260,

            decoration: BoxDecoration(

              gradient: LinearGradient(

                begin: Alignment.topCenter,

                end: Alignment.bottomCenter,

                colors: [

                  AppColors.primary
                      .withValues(
                    alpha: 0.10,
                  ),

                  AppColors.background,
                ],
              ),
            ),
          ),

          SafeArea(

            child: SingleChildScrollView(

              padding:
              const EdgeInsets.symmetric(
                horizontal: 22,
              ),

              child: Form(

                key: _formKey,

                child: Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    const SizedBox(height: 14),

                    /// HEADER
                    Row(
                      children: [

                        Container(

                          decoration: BoxDecoration(

                            color:
                            AppColors.white,

                            borderRadius:
                            BorderRadius.circular(
                              14,
                            ),

                            boxShadow: [

                              BoxShadow(

                                color:
                                Colors.black
                                    .withValues(
                                  alpha: 0.03,
                                ),

                                blurRadius: 12,

                                offset:
                                const Offset(
                                  0,
                                  6,
                                ),
                              ),
                            ],
                          ),

                          child: IconButton(

                            onPressed: () {
                              Navigator.pop(context);
                            },

                            icon: const Icon(

                              Icons.arrow_back,

                              color:
                              AppColors.primary,
                            ),
                          ),
                        ),

                        const Spacer(),

                        const Text(

                          "Vitality",

                          style: TextStyle(

                            color:
                            AppColors.primary,

                            fontWeight:
                            FontWeight.w900,

                            fontSize: 18,
                          ),
                        ),

                        const Spacer(),

                        const SizedBox(width: 48),
                      ],
                    ),

                    const SizedBox(height: 36),

                    /// SECURITY BADGE
                    Container(

                      padding:
                      const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),

                      decoration: BoxDecoration(

                        color:
                        AppColors.secondary,

                        borderRadius:
                        BorderRadius.circular(
                          30,
                        ),
                      ),

                      child: const Text(

                        "SECURITY CENTER",

                        style: TextStyle(

                          color:
                          AppColors.primary,

                          fontSize: 10,

                          fontWeight:
                          FontWeight.w900,

                          letterSpacing: 1,
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    /// TITLE
                    const Text(

                      "Forgot Password?",

                      style: TextStyle(

                        fontSize: 34,

                        fontWeight:
                        FontWeight.w900,

                        height: 1.1,

                        color:
                        AppColors.textDark,
                      ),
                    ),

                    const SizedBox(height: 14),

                    /// DESCRIPTION
                    const Text(

                      "Enter your registered email address and we will send you a secure password reset link.",

                      style: TextStyle(

                        color:
                        AppColors.textLight,

                        fontSize: 14,

                        height: 1.6,
                      ),
                    ),

                    const SizedBox(height: 40),

                    /// EMAIL LABEL
                    const Text(

                      "EMAIL ADDRESS",

                      style: TextStyle(

                        fontSize: 11,

                        fontWeight:
                        FontWeight.w800,

                        color:
                        AppColors.textLight,
                      ),
                    ),

                    const SizedBox(height: 10),

                    /// EMAIL FIELD
                    AppTextField(

                      controller:
                      emailController,

                      hint:
                      "example@email.com",

                      icon:
                      Icons.email_outlined,

                      keyboardType:
                      TextInputType
                          .emailAddress,

                      validator:
                      AppValidator
                          .validateEmail,
                    ),

                    const SizedBox(height: 30),

                    /// SEND BUTTON
                    AppButton(

                      text:
                      "Send Reset Link",

                      onPressed:
                      sendResetLink,
                    ),

                    const SizedBox(height: 50),

                    /// INFO CARD
                    Container(

                      width: double.infinity,

                      padding:
                      const EdgeInsets.all(
                        22,
                      ),

                      decoration: BoxDecoration(

                        color:
                        AppColors.white,

                        borderRadius:
                        BorderRadius.circular(
                          28,
                        ),

                        boxShadow: [

                          BoxShadow(

                            color:
                            Colors.black
                                .withValues(
                              alpha: 0.03,
                            ),

                            blurRadius: 18,

                            offset:
                            const Offset(
                              0,
                              8,
                            ),
                          ),
                        ],
                      ),

                      child: const Column(

                        children: [

                          Icon(

                            Icons
                                .shield_outlined,

                            color:
                            AppColors.primary,

                            size: 34,
                          ),

                          SizedBox(height: 16),

                          Text(

                            "Your account security is our top priority.",

                            textAlign:
                            TextAlign.center,

                            style: TextStyle(

                              fontWeight:
                              FontWeight.w800,

                              color:
                              AppColors.textDark,
                            ),
                          ),

                          SizedBox(height: 10),

                          Text(

                            "All reset requests are protected with secure encryption and authentication methods.",

                            textAlign:
                            TextAlign.center,

                            style: TextStyle(

                              color:
                              AppColors.textLight,

                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),

                    /// LOGIN
                    Center(

                      child: GestureDetector(

                        onTap: () {

                          Navigator
                              .pushReplacementNamed(

                            context,

                            RoutesName.login,
                          );
                        },

                        child: const Text.rich(

                          TextSpan(

                            text:
                            "Remember your password? ",

                            style: TextStyle(

                              color:
                              AppColors.textLight,

                              fontWeight:
                              FontWeight.w600,
                            ),

                            children: [

                              TextSpan(

                                text:
                                "Log In",

                                style: TextStyle(

                                  color:
                                  AppColors.primary,

                                  fontWeight:
                                  FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}