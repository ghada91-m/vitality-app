import 'package:flutter/material.dart';

class OnboardingAIScanScreen extends StatefulWidget {
  const OnboardingAIScanScreen({super.key});

  @override
  State<OnboardingAIScanScreen> createState() => _OnboardingAIScanScreenState();
}

class _OnboardingAIScanScreenState extends State<OnboardingAIScanScreen>
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
      duration: const Duration(milliseconds: 1300),
    )..forward();

    _imageScale = Tween<double>(begin: 0.92, end: 1).animate(_controller);
    _scanPulse = Tween<double>(begin: 0.85, end: 1).animate(_controller);

    _textSlide = Tween<Offset>(
      begin: const Offset(0, 0.25),
      end: Offset.zero,
    ).animate(_controller);

    _fade = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget dot(bool active) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: active ? 18 : 7,
      height: 7,
      decoration: BoxDecoration(
        color: active ? const Color(0xFF0B7A3B) : const Color(0xFFD8E8DE),
        borderRadius: BorderRadius.circular(20),
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

              /// IMAGE + AI
              FadeTransition(
                opacity: _fade,
                child: ScaleTransition(
                  scale: _imageScale,
                  child: SizedBox(
                    height: 260,
                    child: Stack(
                      children: [

                        /// image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.network(
                            "https://images.unsplash.com/photo-1512621776951-a57141f2eefd",
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 240,
                          ),
                        ),

                        /// scan effect
                        Center(
                          child: ScaleTransition(
                            scale: _scanPulse,
                            child: Container(
                              width: 200,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: const Color(0xFF8BE49B),
                                  width: 3,
                                ),
                              ),
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
                position: _textSlide,
                child: FadeTransition(
                  opacity: _fade,
                  child: Column(
                    children: const [

                      Text(
                        "Smart Food",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "Tracking",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0B7A3B),
                        ),
                      ),

                      SizedBox(height: 10),

                      Text(
                        "Snap your meal and let AI analyze it",
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