import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class HealthStats extends StatelessWidget {

  const HealthStats({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(

      children: const [

        Expanded(

          child: _StatCard(

            title: "Sleep Quality",

            value: "7h 20m",

            icon: Icons.nightlight_round,

            color: Color(0xffF6F1D3),
          ),
        ),

        SizedBox(width: 16),

        Expanded(

          child: _StatCard(

            title: "Steps Today",

            value: "2,410",

            icon: Icons.local_fire_department,

            color: Color(0xffFCE4DF),
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {

  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({

    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(

        color: color,

        borderRadius:
        BorderRadius.circular(24),
      ),

      child: Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          Icon(
            icon,
            color: AppColors.primary,
          ),

          const SizedBox(height: 18),

          Text(
            value,

            style: const TextStyle(

              fontSize: 26,

              fontWeight:
              FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            title,

            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}