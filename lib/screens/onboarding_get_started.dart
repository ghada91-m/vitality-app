import 'package:flutter/material.dart';

class OnboardingGetStartedScreen extends StatefulWidget {
  const OnboardingGetStartedScreen({super.key});

  @override
  State<OnboardingGetStartedScreen> createState() =>
      _OnboardingGetStartedScreenState();
}

class _OnboardingGetStartedScreenState extends State<OnboardingGetStartedScreen>
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
        color: active ? const Color(0xFF0B7A3B) : const Color(0xFFD8E8DE),
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
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF0B7A3B)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF7FBF8),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [

              const SizedBox(height: 30),

              /// IMAGE
              FadeTransition(
                opacity: _fade,
                child: ScaleTransition(
                  scale: _scale,
                  child: SizedBox(
                    height: 300,
                    child: Stack(
                      children: [

                        Positioned(
                          left: 0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.network(
                              "https://images.unsplash.com/photo-1529156069898-49953e39b3ac",
                              width: 180,
                              height: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Positioned(
                          right: 0,
                          child: Container(
                            width: 90,
                            height: 140,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF5F9A8),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(Icons.emoji_events),
                          ),
                        ),

                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: SizedBox(
                            width: 180,
                            child: smallCard(
                              icon: Icons.favorite_border,
                              text: "Join 2.4k users",
                              color: const Color(0xFF9CF2B3),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// TEXT
              SlideTransition(
                position: _slide,
                child: FadeTransition(
                  opacity: _fade,
                  child: Column(
                    children: const [

                      Text(
                        "Achieve Your Best",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 10),

                      Text(
                        "Start your health journey",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.green),
                      ),

                      SizedBox(height: 10),

                      Text(
                        "Track your progress and stay motivated",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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