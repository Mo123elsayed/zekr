import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zekr/core/themes/app_colors.dart';

class NextZikrButton extends StatefulWidget {
  final int currentIndex;
  final int totalAzkar;
  final PageController pageController;
  const NextZikrButton({
    super.key,
    required this.currentIndex,
    required this.totalAzkar,
    required this.pageController,
  });

  @override
  State<NextZikrButton> createState() => _NextZikrButtonState();
}

class _NextZikrButtonState extends State<NextZikrButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondaryGreen,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),

      // this button will be disabled if the current index is the last zikr
      // so we check if the current index is less than the total azkar - 1
      // if it is, we allow the button to be pressed and go to the next page
      // if not, we disable the button by setting onPressed to null
      onPressed: widget.currentIndex < widget.totalAzkar - 1
          ? () {
              widget.pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Next',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500, // بندي للخط سمك بسيط
              ),
            ),
            SizedBox(width: 8.w), // مسافة صغيرة بين الكلمة والسهم
            Icon(
              Icons
                  .arrow_forward_ios_rounded, // أيقونة السهم العادية زي التصميم
              color: Colors.white,
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }
}
