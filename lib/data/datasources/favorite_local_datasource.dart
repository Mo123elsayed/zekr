import 'package:shared_preferences/shared_preferences.dart';

class FavoriteLocalDatasource {
  /// the key of the favorites list
  /// the key is used to store the favorites list in the shared preferences
  /// 
  static const String _favoriteKey = 'favorite_zikr';

  /// this method is used to get the favorites from the list
  /// and return the list of favorites
  /// if the favorites list is empty then it will return an empty list
  /// else it will return the list of favorites from the list
  /// the favorites list is stored in the shared preferences
  ///
  Future<List<dynamic>> getFavorite() async {
    
    final pref = await SharedPreferences.getInstance();
    /// get the favorites list from the shared preferences
    /// 
    return pref.getStringList(_favoriteKey) ?? [];
  }
  /// this method is used to add the favorite to the list
  Future<void> addFavorite(String favoriteKey) async {
    final pref = await SharedPreferences.getInstance();
    final favoriteZikr = pref.getStringList(_favoriteKey) ?? [];
    if (!favoriteZikr.contains(favoriteKey)) {
      favoriteZikr.add(favoriteKey);
      await pref.setStringList(_favoriteKey, favoriteZikr);
    }
  }
  /// this method is used to remove the favorite from the list
  Future<void> removeFavorites(String favoriteKey) async {
    final pref = await SharedPreferences.getInstance();

    final favoriteZikr = pref.getStringList(_favoriteKey) ?? [];
    favoriteZikr.remove(favoriteKey);

    await pref.setStringList(favoriteKey, favoriteZikr);
  }

  /// this method is used to check if the favorite is already added
  Future<bool> isFavorite(String favoriteKey) async {
    final prefs = await SharedPreferences.getInstance();

    final favorites = prefs.getStringList(favoriteKey) ?? [];

    return favorites.contains(favoriteKey);
  }
}
