import 'package:flutter/material.dart';

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
      duration: const Duration(milliseconds: 1200),
    )..forward();

    _fade = Tween<double>(begin: 0, end: 1).animate(_controller);

    _scale = Tween<double>(begin: 0.92, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget bar(double h) {
    return Container(
      width: 16,
      height: h,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF0B7A3B).withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF7FBF8),
      child: SafeArea(
        child: Column(
          children: [

            const SizedBox(height: 30),

            /// 🔥 Animation card
            FadeTransition(
              opacity: _fade,
              child: ScaleTransition(
                scale: _scale,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(20),
                  height: 240,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF6EF),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text(
                        "Weekly Report",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      const Spacer(),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          bar(30),
                          bar(50),
                          bar(70),
                          bar(90),
                          bar(60),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// 🔥 Text
            SlideTransition(
              position: _slide,
              child: FadeTransition(
                opacity: _fade,
                child: Column(
                  children: const [
                    Text(
                      "Insights that Matter",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "Understand your habits with analytics and personalized health tips.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}