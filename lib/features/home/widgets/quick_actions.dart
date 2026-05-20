import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {

    return const Row(

      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,

      children: [

        _ActionCard(
          title: "Add Meal",
          icon: Icons.add_circle_outline,
          active: true,
        ),

        _ActionCard(
          title: "Scan Food",
          icon: Icons.camera_alt_outlined,
        ),

        _ActionCard(
          title: "View\nProgress",
          icon: Icons.insights_outlined,
        ),
      ],
    );
  }
}

class _ActionCard extends StatelessWidget {

  final String title;
  final IconData icon;
  final bool active;

  const _ActionCard({

    required this.title,
    required this.icon,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      width: 92,
      height: 92,

      decoration: BoxDecoration(

        color: active
            ? AppColors.primary
            : Colors.white,

        borderRadius:
        BorderRadius.circular(22),
      ),

      child: Column(

        mainAxisAlignment:
        MainAxisAlignment.center,

        children: [

          Icon(
            icon,

            size: 26,

            color: active
                ? Colors.white
                : AppColors.primary,
          ),

          const SizedBox(height: 10),

          Text(
            title,

            textAlign: TextAlign.center,

            style: TextStyle(

              fontSize: 11,

              fontWeight:
              FontWeight.bold,

              color: active
                  ? Colors.white
                  : AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }
}