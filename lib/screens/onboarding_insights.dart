import 'package:flutter/material.dart';
import 'login.dart';
import 'onboarding_get_started.dart';

class OnboardingInsightsScreen extends StatefulWidget {
  const OnboardingInsightsScreen({super.key});

  @override
  State<OnboardingInsightsScreen> createState() =>
      _OnboardingInsightsScreenState();
}

class _OnboardingInsightsScreenState extends State<OnboardingInsightsScreen>
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
      duration: const Duration(milliseconds: 1300),
    )..forward();

    _fade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _scale = Tween<double>(begin: 0.92, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.25),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
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
        color: active ? const Color(0xFF0B7A3B) : const Color(0xFFD8E8DE),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget bar(double height) {
    return Container(
      width: 18,
      height: height,
      margin: const EdgeInsets.only(right: 9),
      decoration: BoxDecoration(
        color: const Color(0xFF0B7A3B).withValues(alpha: 0.75),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget statCard({
    required IconData icon,
    required String title,
    required String value,
    required double top,
    required double left,
  }) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        width: 130,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.95),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: const Color(0xFFE5F1EA),
              child: Icon(icon, color: const Color(0xFF0B7A3B), size: 17),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 10,
                color: Color(0xFF7C8A84),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF1F2D2A),
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FBF8),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFF7FBF8),
                Color(0xFFEFF7F2),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [
                const SizedBox(height: 18),

                Row(
                  children: [
                    const Icon(Icons.eco, color: Color(0xFF0B7A3B), size: 18),
                    const SizedBox(width: 6),
                    const Text(
                      "Verdant Crisp",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF143D2A),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.circle, size: 7, color: Color(0xFF0B7A3B)),
                          SizedBox(width: 6),
                          Text(
                            "2 / 3",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF5F6F68),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                FadeTransition(
                  opacity: _fade,
                  child: ScaleTransition(
                    scale: _scale,
                    child: SizedBox(
                      height: 285,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Center(
                            child: Container(
                              width: double.infinity,
                              height: 250,
                              decoration: BoxDecoration(
                                color: const Color(0xFFEAF6EF),
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                          ),

                          Positioned(
                            top: 25,
                            left: 28,
                            right: 60,
                            child: Container(
                              height: 145,
                              padding: const EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.9),
                                borderRadius: BorderRadius.circular(24),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.06),
                                    blurRadius: 18,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.analytics,
                                        color: Color(0xFF0B7A3B),
                                        size: 22,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        "Weekly Report",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xFF1F2D2A),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      bar(34),
                                      bar(48),
                                      bar(72),
                                      bar(95),
                                      bar(58),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          statCard(
                            icon: Icons.local_fire_department,
                            title: "Calories",
                            value: "-320",
                            top: 155,
                            left: 18,
                          ),

                          Positioned(
                            right: 10,
                            bottom: 28,
                            child: Container(
                              width: 155,
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(22),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.10),
                                    blurRadius: 18,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: const Row(
                                children: [
                                  CircleAvatar(
                                    radius: 18,
                                    backgroundColor: Color(0xFFE5F1EA),
                                    child: Icon(
                                      Icons.tips_and_updates,
                                      color: Color(0xFF0B7A3B),
                                      size: 19,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      "Protein goal improved by 18%",
                                      style: TextStyle(
                                        fontSize: 11,
                                        height: 1.3,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF1F2D2A),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Positioned(
                            right: 55,
                            top: 112,
                            child: Container(
                              width: 42,
                              height: 42,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.10),
                                    blurRadius: 12,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.auto_awesome,
                                color: Color(0xFF0B7A3B),
                                size: 21,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                SlideTransition(
                  position: _slide,
                  child: FadeTransition(
                    opacity: _fade,
                    child: Column(
                      children: [
                        const Text(
                          "Insights that Matter",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            height: 1.1,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF1F2D2A),
                          ),
                        ),
                        const SizedBox(height: 14),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "Understand your habits with deep-dive analytics and personalized health tips.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF6F7D76),
                              fontSize: 13,
                              height: 1.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            dot(false),
                            dot(true),
                            dot(false),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const Spacer(),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const OnboardingGetStartedScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0B7A3B),
                      foregroundColor: Colors.white,
                      elevation: 8,
                      shadowColor:
                      const Color(0xFF0B7A3B).withValues(alpha: 0.35),
                      padding: const EdgeInsets.symmetric(vertical: 17),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => LoginScreen()),
                    );
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      color: Color(0xFF6F7D76),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                const SizedBox(height: 14),
              ],
            ),
          ),
        ),
      ),
    );
  }
}