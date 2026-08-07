import 'package:dart_either/dart_either.dart';

abstract class CategoriesAbstractRepo {
  Future<Either> loadCategories();
  Future<Either> loadAzkar(String fileName);
 }