import 'package:flutter/material.dart';

class WeekReviewCard
    extends StatelessWidget {

  final int workouts;
  final int goal;

  final int streak;
  final int hydration;

  const WeekReviewCard({
    super.key,
    required this.workouts,
    required this.goal,
    required this.streak,
    required this.hydration,
  });

  @override
  Widget build(BuildContext context) {

    return Card(

      child: Column(

        children: [

          ListTile(
            title: const Text(
              "Workouts completed",
            ),
            trailing: Text(
              "$workouts/$goal",
            ),
          ),

          ListTile(
            title: const Text(
              "Meal logging streak",
            ),
            trailing:
            Text("$streak days"),
          ),

          ListTile(
            title: const Text(
              "Hydration target",
            ),
            trailing:
            Text("$hydration%"),
          ),
        ],
      ),
    );
  }
}