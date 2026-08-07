import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zekr/data/repositories/categories_repo/categories_abstract_repo.dart';
import 'package:zekr/data/repositories/categories_repo/categories_implementation_repo.dart';
import 'package:zekr/models/category_model.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesAbstractRepo categoriesRepo= CategoriesImplementationRepo();
  CategoriesCubit() : super(CategoriesInitial());
  Future<void> getCategories() async {
    emit(CategoriesLoading());
      final categories = await categoriesRepo.loadCategories();
      categories.fold(ifLeft: (errorMessage) {
        emit(CategoriesFailed(errorMessage));
      }, ifRight: (categories) {
        emit(CategoriesSuccess(categories));
      });
    
  }
}
