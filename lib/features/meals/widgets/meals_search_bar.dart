import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class MealsSearchBar extends StatelessWidget {
  const MealsSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,

      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(16),
      ),

      child: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.hint,
          ),
          hintText: "Search food database...",
        ),
      ),
    );
  }
}