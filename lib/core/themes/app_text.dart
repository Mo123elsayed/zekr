import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zekr/core/themes/app_colors.dart';

class AppText {
  static TextStyle serifText20BoldGreen = TextStyle(
    color: AppColors.secondaryGreen,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    fontFamily: 'DMSerifText',
  );
  static TextStyle cairo25BoldGreen = TextStyle(
    fontSize: 8.sp,
    fontFamily: 'Cairo',
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 15, 127, 82),
  );
}
