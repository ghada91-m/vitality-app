import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class OnboardingGetStartedScreen extends StatefulWidget {
  const OnboardingGetStartedScreen({super.key});

  @override
  State<OnboardingGetStartedScreen> createState() =>
      _OnboardingGetStartedScreenState();
}

class _OnboardingGetStartedScreenState
    extends State<OnboardingGetStartedScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  late Animation<double> _fade;

  late Animation<double> _scale;

  late Animation<Offset> _slide;

  @override
  void initState() {

    super.initState();

    _controller = AnimationController(

      vsync: this,

      duration: const Duration(milliseconds: 1500),

    )..repeat(reverse: true);

    _fade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);

    _scale = Tween<double>(
      begin: 0.95,
      end: 1,
    ).animate(

      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    _slide = Tween<Offset>(

      begin: const Offset(0, 0.25),

      end: Offset.zero,

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

  Widget smallCard({

    required IconData icon,

    required String text,

    required Color color,

  }) {

    return Container(

      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(

        color: color,

        borderRadius: BorderRadius.circular(24),

        boxShadow: [

          BoxShadow(

            color: Colors.black
                .withValues(alpha: 0.05),

            blurRadius: 16,

            offset: const Offset(0, 8),
          ),
        ],
      ),

      child: Row(
        children: [

          CircleAvatar(

            backgroundColor: AppColors.lightGreen,

            child: Icon(
              icon,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(

            child: Text(

              text,

              style: const TextStyle(

                fontWeight: FontWeight.w800,

                color: AppColors.textDark,
              ),
            ),
          ),
        ],
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

              const SizedBox(height: 20),

              /// IMAGE SECTION
              FadeTransition(

                opacity: _fade,

                child: ScaleTransition(

                  scale: _scale,

                  child: SizedBox(

                    height: 360,

                    child: Stack(
                      children: [

                        /// GREEN BACKGROUND CIRCLE
                        Positioned(

                          top: 20,

                          left: 40,

                          child: Container(

                            width: 240,

                            height: 240,

                            decoration: BoxDecoration(

                              shape: BoxShape.circle,

                              color: AppColors.secondary
                                  .withValues(alpha: 0.15),
                            ),
                          ),
                        ),

                        /// MAIN IMAGE
                        Positioned(

                          left: 0,

                          child: Container(

                            decoration: BoxDecoration(

                              borderRadius:
                              BorderRadius.circular(34),

                              boxShadow: [

                                BoxShadow(

                                  color: Colors.black
                                      .withValues(alpha: 0.08),

                                  blurRadius: 24,

                                  offset: const Offset(0, 14),
                                ),
                              ],
                            ),

                            child: ClipRRect(

                              borderRadius:
                              BorderRadius.circular(34),

                              child: Image.asset(

                                "assets/images/get_started.jpg",

                                width: 210,

                                height: 240,

                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),

                        /// GOALS CARD
                        Positioned(

                          top: 40,

                          right: 0,

                          child: Container(

                            width: 120,

                            height: 150,

                            decoration: BoxDecoration(

                              color: AppColors.yellowCard,

                              borderRadius:
                              BorderRadius.circular(28),

                              boxShadow: [

                                BoxShadow(

                                  color: Colors.black
                                      .withValues(alpha: 0.05),

                                  blurRadius: 18,

                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),

                            child: const Column(

                              mainAxisAlignment:
                              MainAxisAlignment.center,

                              children: [

                                Icon(

                                  Icons.workspace_premium,

                                  size: 38,

                                  color: AppColors.primary,
                                ),

                                SizedBox(height: 12),

                                Text(

                                  "Top Goals",

                                  style: TextStyle(

                                    fontWeight:
                                    FontWeight.w900,

                                    color:
                                    AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        /// USERS CARD
                        Positioned(

                          bottom: 10,

                          left: 0,

                          child: SizedBox(

                            width: 220,

                            child: smallCard(

                              icon: Icons.favorite,

                              text: "Join 2.4k wellness users",

                              color: AppColors.white
                                  .withValues(alpha: 0.92),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// TEXT SECTION
              SlideTransition(

                position: _slide,

                child: FadeTransition(

                  opacity: _fade,

                  child: Column(
                    children: [

                      const Text(

                        "Achieve Your Best",

                        style: TextStyle(

                          fontSize: 31,

                          fontWeight: FontWeight.w900,

                          color: AppColors.textDark,
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(

                        "Transform your lifestyle",

                        textAlign: TextAlign.center,

                        style: TextStyle(

                          color: AppColors.primary,

                          fontSize: 17,

                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      const SizedBox(height: 14),

                      Padding(

                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                        ),

                        child: const Text(

                          "Build healthy habits, monitor progress, and stay inspired every single day with your personalized wellness companion.",

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

                  dot(false),

                  dot(false),

                  dot(true),
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