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
        color: AppColors.counterBackground,
      ),
      child: CircularPercentIndicator(
        radius: 80.w,
        lineWidth: 3.w,

        /// percent is calculated by dividing the current count by the total count
        percent: currentCount / totalCount,

        center: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.refresh, size: 30.sp, color: AppColors.secondaryGreen),

            SizedBox(height: 2.h),

            Text(
              'Tap to Repeat',
              style: TextStyle(
                fontSize: 10.sp,
                color: AppColors.secondaryGreen,
              ),
            ),

            SizedBox(height: 10.h),
            Text(
              '$currentCount/$totalCount',
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.secondaryGreen,
              ),
            ),

            SizedBox(height: 10.h),
            SizedBox(
              width: 100.w,
              child: Text(
                'Long press to reset',
                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: 10.sp,
                  color: AppColors.secondaryGreen,
                ),
              ),
            ),
            // SizedBox(height: 15.h),
          ],
        ),

        progressColor: AppColors.primaryGreen,
        backgroundColor: Colors.black26,
        circularStrokeCap: CircularStrokeCap.round,
      ),
    );
  }
}
