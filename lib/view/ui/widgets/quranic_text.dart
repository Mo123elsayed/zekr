import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zekr/core/themes/app_colors.dart';

class QuranicText extends StatelessWidget {
  final String text;

  const QuranicText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    List<InlineSpan> spans = [];
    final regex = RegExp(r'۝([٠-٩]+)');
    int start = 0;

    for (final match in regex.allMatches(text)) {
      if (match.start > start) {
        spans.add(TextSpan(text: text.substring(start, match.start)));
      }

      String number = match.group(1)!;

      spans.add(
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 6.w),
            width: 20.w,
            height: 20.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.green,
                width: 1.5,
              ), // استخدم AppColors.secondaryGreen
              color: AppColors.lightGreen,
            ),
            alignment: Alignment.center,
            child: Text(
              number,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                color: Colors.green, // استخدم AppColors.secondaryGreen
                height: 1,
              ),
            ),
          ),
        ),
      );

      start = match.end;
    }

    if (start < text.length) {
      spans.add(TextSpan(text: text.substring(start)));
    }

    return RichText(
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          fontSize: 15.sp,
          color: Colors.black87,
          fontFamily: 'Amiri', // خط التشكيل
        ),
        children: spans,
      ),
    );
  }
}
