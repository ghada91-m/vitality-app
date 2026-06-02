import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../widgets/reminder_card.dart';
import '../widgets/ai_tip_card.dart';
import '../widgets/global_preferences.dart';

class RemindersScreen extends StatefulWidget {
  const RemindersScreen({super.key});

  @override
  State<RemindersScreen> createState() => _RemindersScreenState();
}

class _RemindersScreenState extends State<RemindersScreen> {
  final List<Map<String, dynamic>> reminders = [
    {
      "title": "Breakfast Window",
      "time": "07:30 AM",
      "enabled": true,
    },
    {
      "title": "Hydration Pulse",
      "time": "Every 2 Hours",
      "enabled": true,
    },
    {
      "title": "Mindful Lunch",
      "time": "12:30 PM",
      "enabled": false,
    },
  ];

  void addReminder() {
    final titleController = TextEditingController();
    final timeController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Add Reminder",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: "Reminder Name",
                ),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: timeController,
                decoration: const InputDecoration(
                  labelText: "Time",
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    reminders.add({
                      "title": titleController.text,
                      "time": timeController.text,
                      "enabled": true,
                    });
                  });

                  Navigator.pop(context);
                },
                child: const Text("Save"),
              ),

              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: addReminder,
        child: const Icon(Icons.add),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),

                  const Text(
                    "Reminders",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView(
                  children: [
                    ...List.generate(
                      reminders.length,
                          (index) {
                        return ReminderCard(
                          title: reminders[index]["title"],
                          time: reminders[index]["time"],
                          enabled: reminders[index]["enabled"],

                          onToggle: (value) {
                            setState(() {
                              reminders[index]["enabled"] =
                                  value;
                            });
                          },

                          onDelete: () {
                            setState(() {
                              reminders.removeAt(index);
                            });
                          },
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    const AiTipCard(),

                    const SizedBox(height: 20),

                    const GlobalPreferences(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}