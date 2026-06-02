import 'package:flutter/material.dart';

class FoodItemTile extends StatelessWidget {

  final String title;
  final String calories;

  const FoodItemTile({
    super.key,
    required this.title,
    required this.calories,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
        BorderRadius.circular(20),
      ),

      child: Row(

        children: [

          Container(
            width: 50,
            height: 50,
            color: Colors.grey.shade200,
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
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                Text(calories),
              ],
            ),
          ),

          const Icon(Icons.edit),
        ],
      ),
    );
  }
}