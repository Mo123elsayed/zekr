import 'package:dart_either/dart_either.dart';
import 'package:zekr/data/datasources/favorite_local_datasource.dart';
import 'package:zekr/data/repositories/favorites_repo/favorites_abstract_repo.dart';

class FavoritesImplementationRepo implements FavoritesAbstractRepo {
  final FavoriteLocalDatasource _favoriteLocalDatasource =
      FavoriteLocalDatasource();

  /// this method is used to get the favorites from the list
  /// and return the list of favorites
  /// if the favorites list is empty then it will return an empty list
  /// else it will return the list of favorites from the list
  /// the favorites list is stored in the shared preferences
  ///
  @override
  Future<List> getFavorites() async {
    /// get the favorites from the local datasource
    return _favoriteLocalDatasource.getFavorite();
  }

  /// this method is used to add the favorite to the list
  /// if the favorite is already added, it will not be added again
  ///
  @override
  Future<Either> addFavorite(String favoriteKey) async {
    /// add the favorite to the local datasource
    /// If it already exists, it will not be added again.
    await _favoriteLocalDatasource.addFavorite(favoriteKey);
    try {
      final isFavorite = await _favoriteLocalDatasource.isFavorite(favoriteKey);
      if (isFavorite) {
        /// if the favorite is already added, it will return a left value
        await _favoriteLocalDatasource.removeFavorites(favoriteKey);
        return Left('Favorite already exists');
      } else {
        /// add the favorite to the local datasource
        /// 
        await _favoriteLocalDatasource.addFavorite(favoriteKey);
        return Right(true);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> removeFavorite(String favoriteKey) async {
    try {
      /// remove the favorite from the local datasource
      await _favoriteLocalDatasource.removeFavorites(favoriteKey);

      ///
      return Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> isFavorite(String favoriteKey) async {
    try {
      /// check if the favorite is already added
      return Right(_favoriteLocalDatasource.isFavorite(favoriteKey));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
