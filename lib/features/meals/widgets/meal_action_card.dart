import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class MealActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const MealActionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor:
            AppColors.secondary,

            child: Icon(
              icon,
              color: AppColors.primary,
            ),
          ),

          const Spacer(),

          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            subtitle,
            style: const TextStyle(
              color: AppColors.textLight,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}