import 'package:flutter/material.dart';

class BmiCard extends StatelessWidget {

  final double bmi;
  final String status;

  const BmiCard({
    super.key,
    required this.bmi,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(20),
      ),

      child: Row(
        children: [

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                const Text(
                  "Current Status",
                ),

                Text(
                  status,
                  style:
                  const TextStyle(
                    fontSize: 24,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                Text(
                  bmi.toStringAsFixed(1),
                ),
              ],
            ),
          ),

          SizedBox(
            width: 80,
            height: 80,

            child:
            CircularProgressIndicator(
              value: bmi / 30,
            ),
          ),
        ],
      ),
    );
  }
}