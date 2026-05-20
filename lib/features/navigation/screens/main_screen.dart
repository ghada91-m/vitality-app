import 'package:flutter/material.dart';

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

      body: screens[currentIndex],

      bottomNavigationBar:
      BottomNavigationBar(

        currentIndex: currentIndex,

        onTap: (index) {

          setState(() {

            currentIndex = index;
          });
        },

        type:
        BottomNavigationBarType.fixed,

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: "Log",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: "AI Scan",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: "Progress",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}