import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zekr/view_model/categories_cubit/categories_cubit.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit()..getCategories(),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('Categories')),
            body: BlocConsumer<CategoriesCubit, CategoriesState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is CategoriesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CategoriesFailed) {
                  return Center(child: Text('Error: ${state.errorMessage}'));
                }
                if (state is CategoriesSuccess) {
                  return ListView.builder(
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: const Icon(Icons.category),
                      title: Text(state.categories[index].title),
                      onTap: () {
                        // Handle category tap
                      },
                    ),
                  );
                }
                return Center(child: Text('No categories available'));
              },
            ),
            
          );
        },
      ),
    );
  }
}
