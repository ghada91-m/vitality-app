import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/storage/app_preferences.dart';
import '../widgets/bmi_card.dart';
import '../widgets/goal_card.dart';
import '../widgets/lifestyle_card.dart';
import '../widgets/profile_header.dart';
import '../widgets/settings_section.dart';
import '../widgets/user_info_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AppPreferences.getUser();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ProfileHeader(user: user),
              const SizedBox(height: 18),
              UserInfoCard(user: user),
              const SizedBox(height: 16),
              LifestyleCard(user: user),
              const SizedBox(height: 16),
              GoalCard(user: user),
              const SizedBox(height: 16),
              BmiCard(user: user),
              const SizedBox(height: 16),
              const SettingsSection(),
            ],
          ),
        ),
      ),
    );
  }
}