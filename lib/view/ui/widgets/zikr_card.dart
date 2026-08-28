import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zekr/core/themes/app_text.dart';
import 'package:zekr/view_model/azkar_cubit/azkar_cubit.dart';

class ZikrCard extends StatefulWidget {
  const ZikrCard({super.key});

  @override
  State<ZikrCard> createState() => _ZikrCardState();
}

class _ZikrCardState extends State<ZikrCard> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return BlocConsumer<AzkarCubit, AzkarState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is AzkarLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is AzkarFailure) {
          return Center(child: Text('Error: ${state.error}'));
        }
        if (state is AzkarSuccess) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.bookmark, size: 50, color: Colors.green[700]),
                const SizedBox(height: 20),
                Text(
                  state.azkar.azkar[currentIndex].text,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  style: AppText.cairo25BoldBlack,
                ),
                Row(
                  children: [
                    const Divider(
                      color: Colors.green,
                      thickness: 2,
                      indent: 50,
                      endIndent: 50,
                    ),
                    SvgPicture.asset(
                      'assets/svgs/rub-el-hizb.svg',
                      width: 30,
                      height: 30,
                      colorFilter: ColorFilter.mode(
                        Colors.green[700]!,
                        BlendMode.srcIn,
                      ),
                    ),
                    const Divider(
                      color: Colors.green,
                      thickness: 2,
                      indent: 50,
                      endIndent: 50,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      state.azkar.azkar[currentIndex].transliteration,
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Pliant', fontSize: 15),
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 8, 112, 74),
                      thickness: 2,
                      indent: 50,
                      endIndent: 50,
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        return const Center(child: Text('No data available'));
      },
    );
  }
}
