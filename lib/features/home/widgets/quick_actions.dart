import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class QuickActions extends StatelessWidget {
  final VoidCallback onAddMeal;
  final VoidCallback onRemoveMeal;

  const QuickActions({
    super.key,
    required this.onAddMeal,
    required this.onRemoveMeal,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _ActionCard(
          title: "Add Meal",
          icon: Icons.add_circle_outline,
          active: true,
          onTap: onAddMeal,
        ),

        _ActionCard(
          title: "Remove",
          icon: Icons.remove_circle_outline,
          onTap: onRemoveMeal,
        ),

        _ActionCard(
          title: "View\nProgress",
          icon: Icons.insights_outlined,
          onTap: () {},
        ),
      ],
    );
  }
}

class _ActionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool active;
  final VoidCallback onTap;

  const _ActionCard({
    required this.title,
    required this.icon,
    required this.onTap,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 92,
        height: 92,
        decoration: BoxDecoration(
          color: active ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 26,
              color: active ? Colors.white : AppColors.primary,
            ),

            const SizedBox(height: 10),

            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: active ? Colors.white : AppColors.textDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}