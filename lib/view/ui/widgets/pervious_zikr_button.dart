import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zekr/core/themes/app_colors.dart';

class PerviousZikrButton extends StatefulWidget {
  final int currentIndex;
  final PageController pageController;
  const PerviousZikrButton({super.key,
    required this.currentIndex,
    required this.pageController,
  });

  @override
  State<PerviousZikrButton> createState() => _PerviousZikrButtonState();
}

class _PerviousZikrButtonState extends State<PerviousZikrButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColors.secondaryGreen, width: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: widget.currentIndex > 0 ?() {
        widget.pageController.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        // Handle previous button press
      } : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 12.0),
        child: Row(
          children: [
            const Icon(Icons.arrow_back_ios_new),
            Text(
              ' Previous',
              style: TextStyle(
                color: AppColors.secondaryGreen,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
