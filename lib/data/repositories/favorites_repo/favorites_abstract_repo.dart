import 'package:dart_either/dart_either.dart';

abstract class FavoritesAbstractRepo {
  Future<List> getFavorites();
  Future<Either> addFavorite(Map<String, dynamic> favoriteData);
  Future<Either> removeFavorite(String favoriteKey);
  Future<Either> isFavorite(Map<String, dynamic> favoriteData);
}
