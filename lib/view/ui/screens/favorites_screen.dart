import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zekr/view_model/favorite_cubit/favorite_cubit.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit()..loadFavorites(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Favorites')),
        body: BlocConsumer<FavoriteCubit, FavoriteState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is FavoriteFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  padding: const EdgeInsets.all(8),
                  backgroundColor: Colors.white,
                  duration: const Duration(seconds: 2),
                  elevation: 5,
                  content: Text(state.errorMessage),
                ),
              );
            }
          },
          builder: (context, state) {
            final favoriteCubit = BlocProvider.of<FavoriteCubit>(context);
            if (state is FavoriteEmpty) {
              return Center(child: Text(state.message));
            }
            if (state is FavoriteSuccess) {
              return ListView.builder(
                itemCount: state.favorites.length,
                itemBuilder: (context, index) {
                  /// this key is used to get the favorite from the list of favorites
                  final favorites = state.favorites[index];

                  /// this key is used to get the favorite from the list of favorites
                  /// and convert it to a map, so that we can access the favorite data
                  final favoriteData = jsonDecode(favorites);
                  return Card(
                    margin: const EdgeInsets.all(8),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      height: 100.h,
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0,
                                      vertical: 5.0,
                                    ),
                                    child: Text(
                                      '${favoriteData['zikr']}',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'Amiri',
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  '${favoriteData['translation']}',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 50.w),
                          IconButton(
                            onPressed: () {
                              favoriteCubit.removeFavorite(
                                favorites.toString(),
                              );
                            },
                            icon: const Icon(
                              Icons.favorite,

                              color: Colors.redAccent,
                            ),
                          ),
                          SizedBox(width: 10.w),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return Center(child: Container());
          },
        ),
      ),
    );
  }
}
