import 'package:flutter/material.dart';
import 'onboarding_get_started.dart';
import 'onboarding_ai_scan.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _leafMove;
  late Animation<double> _leafScale;
  late Animation<double> _leafRotate;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);

    _leafMove = Tween<double>(begin: 0, end: -10).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _leafScale = Tween<double>(begin: 1, end: 1.12).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _leafRotate = Tween<double>(begin: -0.08, end: 0.08).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingAIScanScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget floatingLeaf({
    required double top,
    required double left,
    required double size,
    required double angle,
    required double opacity,
  }) {
    return Positioned(
      top: top,
      left: left,
      child: Transform.rotate(
        angle: angle,
        child: Icon(
          Icons.eco,
          size: size,
          color: const Color(0xFF2E7D32).withValues(alpha: opacity),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F8F5),
      body: Stack(
        children: [
          // Soft background circles
          Positioned(
            top: 90,
            right: -45,
            child: Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF81C784).withValues(alpha: 0.12),
              ),
            ),
          ),

          Positioned(
            top: 250,
            left: -60,
            child: Container(
              width: 190,
              height: 190,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF2E7D32).withValues(alpha: 0.08),
              ),
            ),
          ),

          // Floating small leaves
          floatingLeaf(
            top: 120,
            left: 55,
            size: 22,
            angle: -0.5,
            opacity: 0.18,
          ),
          floatingLeaf(
            top: 210,
            left: 300,
            size: 18,
            angle: 0.4,
            opacity: 0.16,
          ),
          floatingLeaf(
            top: 500,
            left: 65,
            size: 20,
            angle: 0.7,
            opacity: 0.14,
          ),

          // Bottom curved card
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 175,
              decoration: const BoxDecoration(
                color: Color(0xFFE5F1EA),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70),
                  topRight: Radius.circular(70),
                ),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                const Spacer(),

                // Center content
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(0, _leafMove.value),
                            child: Transform.scale(
                              scale: _leafScale.value,
                              child: Transform.rotate(
                                angle: _leafRotate.value,
                                child: child,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 82,
                          height: 82,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(26),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF2E7D32)
                                    .withValues(alpha: 0.20),
                                blurRadius: 40,
                                spreadRadius: 6,
                                offset: const Offset(0, 16),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.eco,
                            color: Color(0xFF2E7D32),
                            size: 46,
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return Opacity(
                            opacity: 0.88 + (_controller.value * 0.12),
                            child: Transform.scale(
                              scale: 0.97 + (_controller.value * 0.03),
                              child: child,
                            ),
                          );
                        },
                        child: const Text(
                          "Vitality",
                          style: TextStyle(
                            fontSize: 44,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF1F2D2A),
                            letterSpacing: -1,
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      const Text(
                        "NOURISH YOUR INTENT",
                        style: TextStyle(
                          fontSize: 12,
                          letterSpacing: 4.2,
                          color: Color(0xFF9DA8A2),
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      const SizedBox(height: 28),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 9,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.75),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: const Color(0xFF2E7D32)
                                .withValues(alpha: 0.12),
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.auto_awesome,
                              size: 16,
                              color: Color(0xFF2E7D32),
                            ),
                            SizedBox(width: 8),
                            Text(
                              "AI-powered nutrition tracking",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF5F6F68),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // Bottom loading section
                Column(
                  children: [
                    Container(
                      width: 135,
                      height: 6,
                      decoration: BoxDecoration(
                        color: const Color(0xFFC8E6C9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            return Container(
                              width: 55 + (_controller.value * 45),
                              height: 6,
                              decoration: BoxDecoration(
                                color: const Color(0xFF2E7D32),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Curating your personalized health journey",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF5F6F68),
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 38),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}