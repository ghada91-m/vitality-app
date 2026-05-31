import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class AiScanBanner extends StatelessWidget {
  const AiScanBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: const DecorationImage(
          image: AssetImage(
            "assets/images/food_banner.png",
          ),
          fit: BoxFit.cover,
        ),
      ),

      child: Container(
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(.55),
              Colors.transparent,
            ],
          ),
        ),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          mainAxisAlignment:
          MainAxisAlignment.end,

          children: [
            const Text(
              "Try AI Scan",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            const Text(
              "Just take a photo of your plate",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 36,

              child: ElevatedButton(
                onPressed: () {},

                style:
                ElevatedButton.styleFrom(
                  backgroundColor:
                  Colors.white,

                  foregroundColor:
                  AppColors.primary,

                  shape:
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(
                        20),
                  ),
                ),

                child: const Text(
                  "Launch",
                  style: TextStyle(
                    fontWeight:
                    FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}