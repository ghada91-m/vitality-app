import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

    checkUser();
  }

  Future<void> checkUser() async {
    await Future.delayed(const Duration(seconds: 3));

    final prefs = await SharedPreferences.getInstance();

    bool seenOnboarding = prefs.getBool("seenOnboarding") ?? false;
    String? token = prefs.getString("token");

    if (!mounted) return;

    if (!seenOnboarding) {
      Navigator.pushReplacementNamed(context, '/onboarding');
    } else if (token == null) {
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      Navigator.pushReplacementNamed(context, '/home');
    }
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

          floatingLeaf(top: 120, left: 55, size: 22, angle: -0.5, opacity: 0.18),
          floatingLeaf(top: 210, left: 300, size: 18, angle: 0.4, opacity: 0.16),
          floatingLeaf(top: 500, left: 65, size: 20, angle: 0.7, opacity: 0.14),

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

                      const Text(
                        "Vitality",
                        style: TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF1F2D2A),
                        ),
                      ),

                      const SizedBox(height: 12),

                      const Text(
                        "NOURISH YOUR INTENT",
                        style: TextStyle(
                          fontSize: 12,
                          letterSpacing: 4.2,
                          color: Color(0xFF9DA8A2),
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                Column(
                  children: [
                    Container(
                      width: 135,
                      height: 6,
                      decoration: BoxDecoration(
                        color: const Color(0xFFC8E6C9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Curating your personalized health journey",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF5F6F68),
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