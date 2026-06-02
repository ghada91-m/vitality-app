import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../models/user_model.dart';

class LifestyleCard extends StatelessWidget {
  final UserModel user;

  const LifestyleCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.cardGreen,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(
              Icons.directions_run,
              color: AppColors.primary,
              size: 30,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Lifestyle',
                  style: TextStyle(
                    color: AppColors.textLight,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  user.lifestyle,
                  style: const TextStyle(
                    color: AppColors.textDark,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}