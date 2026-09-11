import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zekr/core/themes/app_colors.dart';
import 'package:zekr/view/ui/widgets/zikr_progress_indicator.dart';

class ZikrCard extends StatefulWidget {
  final String zikrText;
  final String zikrTransliteration;
  final String zikrTranslation;
  final int azkarRepeat;
  const ZikrCard({
    super.key,
    required this.zikrText,
    required this.zikrTransliteration,
    required this.zikrTranslation,
    required this.azkarRepeat,
  });

  @override
  State<ZikrCard> createState() => _ZikrCardState();
}

class _ZikrCardState extends State<ZikrCard> {
  int currentCount = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      // padding: EdgeInsets.symmetric(horizontal: 10.w),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
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
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 6.h),
          CircleAvatar(
            backgroundColor: Color(0xFFF1F9F6),
            child: Icon(
              Icons.book_outlined,
              size: 20.sp,
              color: Colors.green[700],
            ),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 130.h,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Text(
                    widget.zikrText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryGreen,
                    ),
                  ),
                  // this row is used to create a divider with an icon in the middle
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
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    widget.zikrTransliteration,
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
          SizedBox(child: Divider(color: Colors.grey[200], thickness: 1)),
          SizedBox(height: 10.h),
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
          SizedBox(height: 5.h),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),

              decoration: BoxDecoration(
                color: AppColors.recommendedBackground,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/svgs/rub-el-hizb.svg',
                    width: 15.w,
                    height: 15.h,
                    colorFilter: ColorFilter.mode(
                      Color.fromARGB(255, 8, 112, 74),
                      BlendMode.srcIn,
                    ),
                  ),
                  Text(
                    ' Recommended: ',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 8, 112, 74),
                    ),
                  ),
                  Text(
                    ' ${widget.azkarRepeat} times',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 8, 112, 74),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 15.r,
                  backgroundColor: AppColors.secondaryGreen,
                  child: Icon(
                    Icons.menu_book_rounded,
                    color: AppColors.lightGreen,
                    size: 15.sp,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  'Translation',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondaryGreen,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: SizedBox(
              height: 100.h,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),

                child: Text(
                  widget.zikrTranslation,
                  style: TextStyle(
                    fontFamily: 'Pliant',
                    fontSize: 12.sp,
                    color: Color.fromARGB(255, 95, 95, 95),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
