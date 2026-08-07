part of 'categories_cubit.dart';

sealed class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

final class CategoriesInitial extends CategoriesState {}
final class CategoriesLoading extends CategoriesState {}
final class CategoriesSuccess extends CategoriesState {
  final List<CategoryModel> categories;
  const CategoriesSuccess(this.categories);
}
final class CategoriesFailed extends CategoriesState {
  final String errorMessage;
  const CategoriesFailed(this.errorMessage);
}
