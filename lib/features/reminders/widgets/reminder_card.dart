import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class ReminderCard extends StatelessWidget {
  final String title;
  final String time;
  final bool enabled;
  final Function(bool) onToggle;
  final VoidCallback onDelete;

  const ReminderCard({
    super.key,
    required this.title,
    required this.time,
    required this.enabled,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (_) => onDelete(),
      direction: DismissDirection.endToStart,

      background: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(18),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),

      child: Container(
        margin: const EdgeInsets.only(bottom: 12),

        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),

        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,

              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(.15),
                borderRadius: BorderRadius.circular(14),
              ),

              child: const Icon(
                Icons.alarm,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    time,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            Switch(
              value: enabled,
              onChanged: onToggle,
            ),
          ],
        ),
      ),
    );
  }
}