import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ZikrProgressIndicator extends StatelessWidget {
  final int currentCount;
  final int totalCount;

  const ZikrProgressIndicator({
    super.key,
    required this.currentCount,
    required this.totalCount,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 150,
      lineWidth: 8,

      // نسبة التقدم
      percent: currentCount / totalCount,

      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.refresh,
            size: 45,
            color: Colors.green,
          ),

          const SizedBox(height: 10),

          const Text(
            'Tap to Repeat',
            style: TextStyle(
              fontSize: 20,
              color: Colors.green,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 15),

          Text(
            '$currentCount/$totalCount',
            style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'Long press to reset',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),

      progressColor: Colors.green,
      backgroundColor: Colors.greenAccent.withValues(alpha: 0.1),
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}