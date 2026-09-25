import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zekr/data/repositories/favorites_repo/favorites_abstract_repo.dart';
import 'package:zekr/data/repositories/favorites_repo/favorites_implementation_repo.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  final FavoritesAbstractRepo _favoritesRepo = FavoritesImplementationRepo();

  /// this method is used to load the favorites from the local datasource
  Future<void> loadFavorites() async {
    emit(FavoriteLoading());
    try {
      final favorites = await _favoritesRepo.getFavorites();
      emit(FavoriteSuccess(favorites));
    } catch (e) {
      emit(FavoriteFailure(e.toString()));
    }
  }

  ///this method is used to add the favorite to the list
  Future<void> displayFavorite(String favoriteKey) async {
    emit(FavoriteLoading());

    /// add the favorite to the local datasource
    /// if the favorite is already added, it will not be added again
    ///
    final res = await _favoritesRepo.addFavorite(favoriteKey);

    /// if the favorite is already added, it will return a left value
    /// else it will return a right value
    /// 
    res.fold(
      ifLeft: (message) => emit(FavoriteFailure(message)),
      ifRight: (value) => emit(FavoriteSuccess(value)),
    );
  }

  
}
