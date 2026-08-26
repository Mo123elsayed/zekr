import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zekr/data/datasources/local_datasources.dart';
import 'package:zekr/data/repositories/categories_repo/categories_abstract_repo.dart';
import 'package:zekr/data/repositories/categories_repo/categories_implementation_repo.dart';
import 'package:zekr/models/category_model.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesAbstractRepo categoriesRepo = CategoriesImplementationRepo(
    localDataSource: LocalDataSource(),
  );
  CategoriesCubit() : super(CategoriesInitial());
  Future<void> getCategories() async {
    emit(CategoriesLoading());
    log('Loading categories...');
    final categories = await categoriesRepo.loadCategories();
    categories.fold(
      ifLeft: (errorMessage) {
        emit(CategoriesFailed(errorMessage));
        log('Failed to load categories: $errorMessage');
      },
      ifRight: (categories) {
        emit(CategoriesSuccess(categories));
        log('Categories loaded successfully');
      },
    );
  }
}
