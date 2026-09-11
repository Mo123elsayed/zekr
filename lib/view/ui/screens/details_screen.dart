import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zekr/core/themes/app_colors.dart';
import 'package:zekr/core/themes/app_text.dart';
import 'package:zekr/view/ui/widgets/next_zikr_button.dart';
import 'package:zekr/view/ui/widgets/pervious_zikr_button.dart';
import 'package:zekr/view/ui/widgets/zikr_card.dart';
import 'package:zekr/view_model/azkar_cubit/azkar_cubit.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int currentIndex = 0;
  late PageController _pageController;

  /// Initialize the page controller with a viewport fraction of 1.0, which means that each page will take up the entire width of the screen. This allows for a smooth swiping experience between pages.
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1.0);
  }

  /// Dispose the page controller when the widget is disposed to free up resources and prevent memory leaks.
  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  /// This widget is the root of your application.
  /// details screen will display the azkar of the selected category. It will receive the category id from the previous screen and use it to fetch the azkar from the repository.
  /// The azkar will be displayed in a page view, where the user can swipe left or right to see the next or previous azkar. Each page will display the text and transliteration of the azkar.
  /// The app bar will display the category name and a back button to return to the previous screen. The bottom navigation bar will have a previous button to go back to the previous azkar.
  ///

  @override
  Widget build(BuildContext context) {
    final zekrTitle = ModalRoute.of(context)?.settings.arguments as String;
    log(zekrTitle);
    return BlocProvider(
      create: (context) => AzkarCubit()..displayAzkar(zekrTitle),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(zekrTitle, style: AppText.serifText20BoldGreen),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          ),
          backgroundColor: Color.fromARGB(255, 254, 254, 254),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border, color: Colors.black),
            ),
          ],
        ),
        body: BlocConsumer<AzkarCubit, AzkarState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is AzkarLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is AzkarFailure) {
              return Center(child: Text(state.error));
            }
            if (state is AzkarSuccess) {
              final azkarLength = state.azkar.azkar.length;
              return PageView.builder(
                controller: _pageController,
                onPageChanged: (zikrIndex) {
                  setState(() {
                    currentIndex = zikrIndex;
                  });
                },
                itemCount: azkarLength,
                itemBuilder: (context, index) => ZikrCard(
                  zikrText: state.azkar.azkar[index].text,
                  zikrTransliteration: state.azkar.azkar[index].transliteration,
                  zikrTranslation: state.azkar.azkar[index].translation,
                  azkarRepeat: state.azkar.azkar[index].repeat,
                  onFinished: () {
                    if(currentIndex == azkarLength-1){
                      _showCompletionDialog(context);
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
              );
            }
            return const Text('No data available');
          },
        ),
        bottomNavigationBar: BlocBuilder<AzkarCubit, AzkarState>(
          builder: (context, state) {
            if (state is AzkarSuccess) {
              final totalAzkar = state.azkar.azkar.length;
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.h),

                    child: Row(
                      children: [
                        PerviousZikrButton(
                          currentIndex: currentIndex,
                          pageController: _pageController,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          '${currentIndex + 1}/${totalAzkar}',
                          style: TextStyle(color: AppColors.secondaryGreen),
                        ),
                        SizedBox(width: 10.w),
                        NextZikrButton(
                          currentIndex: currentIndex,
                          totalAzkar: totalAzkar,
                          pageController: _pageController,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  /// This function shows a dialog when the user has completed all the azkar. It displays a congratulatory message and provides an option to return to the home screen.
  /// also, it prevents the user from dismissing the dialog by tapping outside of it, ensuring that they acknowledge the completion of their zikr practice.
  /// we put argument in parameter list to make it more flexible and reusable in different contexts where we might want to show a completion dialog.
  void _showCompletionDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // عشان ميقفلش لو داس بره الدايلوج
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle_outline, color: AppColors.secondaryGreen, size: 60.sp),
            SizedBox(height: 16.h),
            Text(
              'الحمد لله الذي بنعمته تتم الصالحات',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppColors.secondaryGreen),
            ),
            SizedBox(height: 8.h),
            Text(
              'تقبل الله منا ومنكم صالح الأعمال.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.sp, color: Colors.black87),
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryGreen,
                minimumSize: Size(double.infinity, 45.h),
              ),
              onPressed: () {
                Navigator.pop(context); 
                Navigator.pop(context); 
              },
              child: Text('العودة للرئيسية', style: TextStyle(color: Colors.white, fontSize: 14.sp)),
            )
          ],
        ),
      );
    }
  );
}
}
