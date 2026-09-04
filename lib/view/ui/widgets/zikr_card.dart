import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zekr/core/themes/app_text.dart';
import 'package:zekr/view/ui/widgets/zikr_progress_indicator.dart';
import 'package:zekr/view_model/azkar_cubit/azkar_cubit.dart';

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
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          SizedBox(height: 20.h),

          Icon(Icons.bookmark, size: 20.sp, color: Colors.green[700]),
          SizedBox(height: 15.h),
          Text(
            widget.zikrText,
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
            style: AppText.cairo25BoldBlack,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100.w,
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
              SizedBox(
                width: 100.w,
                child: const Divider(
                  color: Color.fromARGB(255, 8, 112, 74),
                  thickness: 1,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                widget.zikrTransliteration,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Pliant', fontSize: 10.sp),
              ),
              // SizedBox(
              //   width: 100.w,
              //   child: Divider(
              //     color: Color.fromARGB(255, 8, 112, 74),
              //     thickness: 2,
              //     indent: 10,
              //     endIndent: 10,
              //   ),
              // ),
              SizedBox(height: 50.h),
            ],
          ),
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
