import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

import '../../home/screens/home_screen.dart';
import '../../meals/screens/meals_screen.dart';
import '../../ai_scan/screens/ai_scan_screen.dart';
import '../../progress/screens/progress_screen.dart';
import '../../profile/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() =>
      _MainScreenState();
}

class _MainScreenState
    extends State<MainScreen> {

  int currentIndex = 0;

  final List<Widget> screens = [

    const HomeScreen(),
    const MealsScreen(),
    const AiScanScreen(),
    const ProgressScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      AppColors.background,

      body: screens[currentIndex],

      /// FLOATING AI BUTTON
      floatingActionButton:
      FloatingActionButton(

        backgroundColor:
        AppColors.primary,

        elevation: 10,

        onPressed: () {

          setState(() {

            currentIndex = 2;
          });
        },

        child: const Icon(

          Icons.auto_awesome,

          color: Colors.white,

          size: 30,
        ),
      ),

      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,

      /// CUSTOM NAVIGATION
      bottomNavigationBar: Container(

        margin: const EdgeInsets.only(

          left: 16,
          right: 16,
          bottom: 16,
        ),

        padding:
        const EdgeInsets.symmetric(

          horizontal: 10,
          vertical: 10,
        ),

        decoration: BoxDecoration(

          color: Colors.white,

          borderRadius:
          BorderRadius.circular(28),

          boxShadow: [

            BoxShadow(

              color:
              Colors.black.withOpacity(0.05),

              blurRadius: 20,

              offset: const Offset(0, 8),
            ),
          ],
        ),

        child: Row(

          mainAxisAlignment:
          MainAxisAlignment.spaceAround,

          children: [

            /// HOME
            _NavItem(

              icon:
              Icons.home_filled,

              label: "Home",

              active:
              currentIndex == 0,

              onTap: () {

                setState(() {

                  currentIndex = 0;
                });
              },
            ),

            /// LOG
            _NavItem(

              icon:
              Icons.restaurant,

              label: "Log",

              active:
              currentIndex == 1,

              onTap: () {

                setState(() {

                  currentIndex = 1;
                });
              },
            ),

            /// SPACE FOR FAB
            const SizedBox(width: 40),

            /// PROGRESS
            _NavItem(

              icon:
              Icons.show_chart,

              label: "Trends",

              active:
              currentIndex == 3,

              onTap: () {

                setState(() {

                  currentIndex = 3;
                });
              },
            ),

            /// PROFILE
            _NavItem(

              icon:
              Icons.person,

              label: "Profile",

              active:
              currentIndex == 4,

              onTap: () {

                setState(() {

                  currentIndex = 4;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {

  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _NavItem({

    required this.icon,
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: onTap,

      child: AnimatedContainer(

        duration:
        const Duration(
            milliseconds: 250),

        padding:
        const EdgeInsets.symmetric(

          horizontal: 14,
          vertical: 10,
        ),

        decoration: BoxDecoration(

          color: active
              ? AppColors.lightGreen
              : Colors.transparent,

          borderRadius:
          BorderRadius.circular(18),
        ),

        child: Column(

          mainAxisSize:
          MainAxisSize.min,

          children: [

            Icon(

              icon,

              size: 22,

              color: active
                  ? AppColors.primary
                  : Colors.grey,
            ),

            const SizedBox(height: 4),

            Text(

              label,

              style: TextStyle(

                fontSize: 11,

                fontWeight:
                FontWeight.w600,

                color: active
                    ? AppColors.primary
                    : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}