import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:zekr/core/themes/app_colors.dart';

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
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        // color: Colors.green,
        color: AppColors.counterBackground,
      ),
      child: CircularPercentIndicator(
        radius: 85.w,
        lineWidth: 4,

        // نسبة التقدم
        percent: currentCount / totalCount,

        center: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.refresh,
              size: 20,
              color: AppColors.secondaryGreen,
            ),

            SizedBox(height: 10.h),

            const Text(
              'Tap to Repeat',
              style: TextStyle(
                fontSize: 13,
                color: AppColors.secondaryGreen,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 15.h),

            Text(
              '$currentCount/$totalCount',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColors.secondaryGreen,
              ),
            ),

            SizedBox(height: 10.h),

            const Text(
              'Long press to reset',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: AppColors.secondaryGreen),
            ),
            SizedBox(height: 10.h),
          ],
        ),

        progressColor: AppColors.primaryGreen,
        backgroundColor: Colors.black26,
        circularStrokeCap: CircularStrokeCap.round,
      ),
    );
  }
}
