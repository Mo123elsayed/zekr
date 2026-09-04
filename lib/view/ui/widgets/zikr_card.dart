import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zekr/core/themes/app_colors.dart';
import 'package:zekr/view/ui/widgets/zikr_progress_indicator.dart';

class ZikrCard extends StatefulWidget {
  final String zikrText;
  final String zikrTransliteration;
  final int azkarRepeat;
  const ZikrCard({
    super.key,
    required this.zikrText,
    required this.zikrTransliteration,
    required this.azkarRepeat,
  });

  @override
  State<ZikrCard> createState() => _ZikrCardState();
}

class _ZikrCardState extends State<ZikrCard> {
  int currentCount = 0;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          CircleAvatar(
            backgroundColor: Color(0xFFF1F9F6),
            child: Icon(
              Icons.book_outlined,
              size: 20.sp,
              color: Colors.green[700],
            ),
          ),
          SizedBox(height: 15.h),
          SizedBox(
            height: 250.h,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Text(
                    widget.zikrText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryGreen,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Divider(color: Colors.black, thickness: 1),
                      ),
                      SizedBox(width: 4.w),
                      SvgPicture.asset(
                        'assets/svgs/rub-el-hizb.svg',
                        width: 15.w,
                        height: 15.h,
                        colorFilter: ColorFilter.mode(
                          Color.fromARGB(255, 8, 112, 74),
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        flex: 1,
                        child: const Divider(
                          color: Color.fromARGB(255, 8, 112, 74),
                          thickness: 1,
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    widget.zikrTransliteration,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Pliant',
                      fontSize: 15.sp,
                      color: Color.fromARGB(255, 95, 95, 95),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h),
          GestureDetector(
            onTap: () {
              setState(() {
                if (currentCount < widget.azkarRepeat) {
                  currentCount++;
                }
              });
            },
            onLongPress: () {
              setState(() {
                currentCount = 0;
              });
            },
            child: ZikrProgressIndicator(
              currentCount: currentCount,
              totalCount: widget
                  .azkarRepeat, // Replace with the actual total count of the zikr
            ),
          ),
        ],
      ),
    );
  }
}
