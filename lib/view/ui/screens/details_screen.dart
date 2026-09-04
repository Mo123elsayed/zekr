import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zekr/core/themes/app_text.dart';
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

  /// This widget is the root of your application.
  /// details screen will display the azkar of the selected category. It will receive the category id from the previous screen and use it to fetch the azkar from the repository.
  /// The azkar will be displayed in a page view, where the user can swipe left or right to see the next or previous azkar. Each page will display the text and transliteration of the azkar.
  ///
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1.0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final zekrId = ModalRoute.of(context)?.settings.arguments as String;
    log(zekrId);
    return BlocProvider(
      create: (context) => AzkarCubit()..displayAzkar(zekrId),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(zekrId, style: AppText.serifText20BoldGreen),
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
              return PageView.builder(
                itemCount: state.azkar.azkar.length,
                itemBuilder: (context, index) => ZikrCard(
                  zikrText: state.azkar.azkar[index].text,
                  zikrTransliteration: state.azkar.azkar[index].transliteration,
                  azkarRepeat: state.azkar.azkar[index].repeat,
                ),
              );
            }
            return const Text('No data available');
          },
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 10,
                ),
                backgroundColor: Colors.green[100],
                side: const BorderSide(color: Colors.green, width: 2),
              ),
              onPressed: () {
                // Handle previous button press
              },
              child: Row(
                children: [
                  const Icon(Icons.arrow_back_ios_new),
                  Text('Previous', style: TextStyle(color: Colors.green[700])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
