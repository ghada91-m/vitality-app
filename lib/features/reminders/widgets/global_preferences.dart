import 'package:flutter/material.dart';

class GlobalPreferences extends StatelessWidget {
  const GlobalPreferences({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        const Text(
          "Global Preferences",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        Container(
          padding: const EdgeInsets.all(16),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),

          child: const Row(
            children: [
              Icon(Icons.auto_awesome),

              SizedBox(width: 10),

              Text("Smart Suggestions"),
            ],
          ),
        ),

        const SizedBox(height: 10),

        Container(
          padding: const EdgeInsets.all(16),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),

          child: const Row(
            children: [
              Icon(Icons.nightlight),

              SizedBox(width: 10),

              Text("Quiet Hours"),
            ],
          ),
        ),
      ],
    );
  }
}