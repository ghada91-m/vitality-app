import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class OnboardingAIScanScreen extends StatefulWidget {
  const OnboardingAIScanScreen({super.key});

  @override
  State<OnboardingAIScanScreen> createState() =>
      _OnboardingAIScanScreenState();
}

class _OnboardingAIScanScreenState
    extends State<OnboardingAIScanScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  late Animation<double> _imageScale;

  late Animation<double> _scanPulse;

  late Animation<Offset> _textSlide;

  late Animation<double> _fade;

  @override
  void initState() {

    super.initState();

    _controller = AnimationController(

      vsync: this,

      duration: const Duration(milliseconds: 1600),

    )..repeat(reverse: true);

    _imageScale = Tween<double>(
      begin: 0.92,
      end: 1,
    ).animate(_controller);

    _scanPulse = Tween<double>(
      begin: 0.92,
      end: 1.05,
    ).animate(

      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _textSlide = Tween<Offset>(

      begin: const Offset(0, 0.25),

      end: Offset.zero,

    ).animate(_controller);

    _fade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);
  }

  @override
  void dispose() {

    _controller.dispose();

    super.dispose();
  }

  Widget dot(bool active) {

    return AnimatedContainer(

      duration: const Duration(milliseconds: 300),

      margin: const EdgeInsets.symmetric(horizontal: 4),

      width: active ? 18 : 7,

      height: 7,

      decoration: BoxDecoration(

        color: active
            ? AppColors.primary
            : AppColors.border,

        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Container(

      color: AppColors.background,

      child: SafeArea(

        child: Padding(

          padding: const EdgeInsets.symmetric(
            horizontal: 22,
          ),

          child: Column(
            children: [

              const SizedBox(height: 30),

              /// IMAGE SECTION
              FadeTransition(

                opacity: _fade,

                child: ScaleTransition(

                  scale: _imageScale,

                  child: SizedBox(

                    height: 340,

                    child: Stack(
                      children: [

                        /// IMAGE CARD
                        Container(

                          decoration: BoxDecoration(

                            borderRadius:
                            BorderRadius.circular(34),

                            boxShadow: [

                              BoxShadow(

                                color: Colors.black
                                    .withValues(alpha: 0.06),

                                blurRadius: 24,

                                offset: const Offset(0, 12),
                              ),
                            ],
                          ),

                          child: ClipRRect(

                            borderRadius:
                            BorderRadius.circular(34),

                            child: Stack(
                              children: [

                                /// LOCAL IMAGE
                                Image.asset(

                                  "assets/images/ai_food.jpg",

                                  fit: BoxFit.cover,

                                  width: double.infinity,

                                  height: 320,
                                ),

                                /// DARK OVERLAY
                                Container(

                                  height: 320,

                                  decoration: BoxDecoration(

                                    gradient: LinearGradient(

                                      begin: Alignment.topCenter,

                                      end: Alignment.bottomCenter,

                                      colors: [

                                        Colors.black.withValues(
                                          alpha: 0.05,
                                        ),

                                        Colors.black.withValues(
                                          alpha: 0.28,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        /// AI BADGE
                        Positioned(

                          top: 18,

                          right: 18,

                          child: Container(

                            padding:
                            const EdgeInsets.symmetric(

                              horizontal: 14,

                              vertical: 8,
                            ),

                            decoration: BoxDecoration(

                              color: AppColors.white
                                  .withValues(alpha: 0.92),

                              borderRadius:
                              BorderRadius.circular(30),

                              boxShadow: [

                                BoxShadow(

                                  color: Colors.black
                                      .withValues(alpha: 0.05),

                                  blurRadius: 12,

                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),

                            child: const Row(

                              children: [

                                Icon(

                                  Icons.auto_awesome,

                                  color: AppColors.primary,

                                  size: 18,
                                ),

                                SizedBox(width: 6),

                                Text(

                                  "AI Scan",

                                  style: TextStyle(

                                    fontWeight:
                                    FontWeight.w800,

                                    color:
                                    AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        /// SCAN EFFECT
                        Center(

                          child: ScaleTransition(

                            scale: _scanPulse,

                            child: Container(

                              width: 210,

                              height: 120,

                              decoration: BoxDecoration(

                                borderRadius:
                                BorderRadius.circular(22),

                                border: Border.all(

                                  color: AppColors.secondary,

                                  width: 3,
                                ),
                              ),
                            ),
                          ),
                        ),

                        /// SCANNING LINE
                        Positioned(

                          top: 150,

                          left: 70,

                          right: 70,

                          child: FadeTransition(

                            opacity: _fade,

                            child: Container(

                              height: 4,

                              decoration: BoxDecoration(

                                color: AppColors.secondary,

                                borderRadius:
                                BorderRadius.circular(20),

                                boxShadow: [

                                  BoxShadow(

                                    color: AppColors.secondary
                                        .withValues(alpha: 0.7),

                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        /// ANALYSIS CARD
                        Positioned(

                          bottom: 16,

                          left: 16,

                          right: 16,

                          child: Container(

                            padding: const EdgeInsets.all(16),

                            decoration: BoxDecoration(

                              color: AppColors.white
                                  .withValues(alpha: 0.90),

                              borderRadius:
                              BorderRadius.circular(24),
                            ),

                            child: const Row(

                              children: [

                                CircleAvatar(

                                  backgroundColor:
                                  AppColors.lightGreen,

                                  child: Icon(

                                    Icons.restaurant,

                                    color:
                                    AppColors.primary,
                                  ),
                                ),

                                SizedBox(width: 12),

                                Expanded(

                                  child: Column(

                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,

                                    children: [

                                      Text(

                                        "Healthy Meal Detected",

                                        style: TextStyle(

                                          fontWeight:
                                          FontWeight.w800,

                                          color:
                                          AppColors.textDark,
                                        ),
                                      ),

                                      SizedBox(height: 4),

                                      Text(

                                        "Calories • Protein • Fiber",

                                        style: TextStyle(

                                          fontSize: 12,

                                          color:
                                          AppColors.textLight,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              /// TEXT SECTION
              SlideTransition(

                position: _textSlide,

                child: FadeTransition(

                  opacity: _fade,

                  child: Column(
                    children: [

                      const Text(

                        "Smart Food",

                        style: TextStyle(

                          fontSize: 31,

                          fontWeight: FontWeight.w900,

                          color: AppColors.textDark,
                        ),
                      ),

                      const Text(

                        "Tracking",

                        style: TextStyle(

                          fontSize: 31,

                          fontWeight: FontWeight.w900,

                          color: AppColors.primary,
                        ),
                      ),

                      const SizedBox(height: 14),

                      Padding(

                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                        ),

                        child: const Text(

                          "Scan your meals instantly and let AI analyze calories, nutrients, and health insights in seconds.",

                          textAlign: TextAlign.center,

                          style: TextStyle(

                            color: AppColors.textLight,

                            fontSize: 15,

                            height: 1.6,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              /// DOTS
              Row(

                mainAxisAlignment:
                MainAxisAlignment.center,

                children: [

                  dot(true),

                  dot(false),

                  dot(false),
                ],
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}