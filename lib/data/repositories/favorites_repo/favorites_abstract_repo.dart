import 'package:dart_either/dart_either.dart';

abstract class FavoritesAbstractRepo {
  Future<List> getFavorites();
  Future<Either> addFavorite(String favoriteKey);
  Future<Either> removeFavorite(String favoriteKey);
  Future<Either> isFavorite(String favoriteKey);
}