import 'package:dart_either/dart_either.dart';
import 'package:zekr/data/datasources/local_datasources.dart';
import 'package:zekr/data/repositories/categories_repo/categories_abstract_repo.dart';

class CategoriesImplementationRepo implements CategoriesAbstractRepo {
  final LocalDataSource localDataSource;
  CategoriesImplementationRepo({required this.localDataSource});
  /// Loads the categories from a data source.
  /// Returns an [Either] containing the result of the operation.
  /// The [Either] can be either a success or a failure, depending on the outcome of the loading process.
  /// Throws an [Exception] if an error occurs during the loading process. 
  @override
  Future<Either> loadCategories() async {
    // Implementation for loading categories
    try {
      final categories = await localDataSource.loadCategories();
      return Right(categories);
    } catch (e) {
      return Left(e.toString());
    }
  }

  /// Loads the azkar from a data source based on the provided [fileName].
  /// Returns an [Either] containing the result of the operation.
  /// The [Either] can be either a success or a failure, depending on the outcome of the loading process.
  /// Throws an [Exception] if an error occurs during the loading process. 
  @override
  Future<Either> loadAzkar(String fileName) async {
    // Implementation for loading azkar based on the provided fileName
    try {
      final azkar = await localDataSource.loadAzkar(fileName);
      return Right(azkar);
    } catch (e) {
      return Left(e.toString());
    }
  }
}