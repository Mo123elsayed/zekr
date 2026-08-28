import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zekr/core/helpers/extensions.dart';
import 'package:zekr/core/routing/routes.dart';
import 'package:zekr/view_model/categories_cubit/categories_cubit.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit()..getCategories(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[100],
          leading: IconButton(
            onPressed: context.pop,
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          ),
          title: const Text(
            'Categories',
            style: TextStyle(
              color: Colors.black,
              fontFamily: "DMSerifText",
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<CategoriesCubit, CategoriesState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is CategoriesFailed) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Center(child: Text('Error: ${state.errorMessage}')),
                  actions: [
                    TextButton(
                      onPressed: () => context.pop(),
                      child: Text('Ok'),
                    ),
                  ],
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is CategoriesLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CategoriesSuccess) {
              return ListView.builder(
                itemCount: state.categories.length,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    tileColor: Colors.green[100],
                    leading: const Icon(Icons.category),

                    title: Text(
                      state.categories[index].title,
                      style: const TextStyle(
                        fontFamily: "Cairo",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      context.pushNamed(
                        Routes.details,
                        arguments: state.categories[index].id,
                      );
                    },
                  ),
                ),
              );
            }
            return Center(child: Text('No categories available'));
          },
        ),
      ),
    );
  }
}
