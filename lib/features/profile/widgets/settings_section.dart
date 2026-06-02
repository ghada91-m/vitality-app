import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/storage/app_preferences.dart';

class SettingsSection extends StatefulWidget {
  const SettingsSection({super.key});

  @override
  State<SettingsSection> createState() => _SettingsSectionState();
}

class _SettingsSectionState extends State<SettingsSection> {
  late bool isDarkMode;

  @override
  void initState() {
    super.initState();
    isDarkMode = AppPreferences.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Column(
        children: [
          _SettingsTile(
            icon: Icons.notifications_none,
            title: 'Notifications',
            onTap: () {},
          ),
          _SettingsTile(
            icon: Icons.language,
            title: 'Language',
            onTap: () {},
          ),
          SwitchListTile(
            value: isDarkMode,
            activeColor: AppColors.primary,
            secondary: const Icon(
              Icons.dark_mode_outlined,
              color: AppColors.primary,
            ),
            title: const Text(
              'Dark Mode',
              style: TextStyle(
                color: AppColors.textDark,
                fontWeight: FontWeight.w700,
              ),
            ),
            onChanged: (value) async {
              await AppPreferences.setTheme(value);

              setState(() {
                isDarkMode = value;
              });
            },
          ),
          _SettingsTile(
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy',
            onTap: () {},
          ),
          _SettingsTile(
            icon: Icons.file_download_outlined,
            title: 'Export Report',
            onTap: () {},
          ),
          _SettingsTile(
            icon: Icons.logout,
            title: 'Logout',
            isLogout: true,
            onTap: () async {
              await AppPreferences.logout();

              if (!context.mounted) return;

              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                    (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isLogout;

  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: isLogout ? Colors.red : AppColors.primary,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isLogout ? Colors.red : AppColors.textDark,
          fontWeight: FontWeight.w700,
        ),
      ),
      trailing: isLogout
          ? null
          : const Icon(
        Icons.chevron_right,
        color: AppColors.textLight,
      ),
    );
  }
}