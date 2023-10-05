import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_store/features/favorite/data/models/FavoriteModel.dart';
import 'package:our_store/features/favorite/data/repo/fav_repo.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this._favoriteRepo) : super(FavoriteInitial());
  static FavoriteCubit get(context) => BlocProvider.of(context);
  final FavoriteRepo _favoriteRepo;

  Future<void> addOrRemoveItemToFavorite({required int? id}) async{
    var data = await _favoriteRepo.addOrRemoveItemToFavorite(id: id);

    data.fold((fail){
      emit(AddFavoriteFailure(fail.errMessage));
    }, (favoriteModel){
      getItemFromFavorite();
      emit(AddFavoriteSuccess(favoriteModel));
    });
  }

  Future<void> getItemFromFavorite() async{
    var data = await _favoriteRepo.getItemFromFavorite();

    data.fold((fail){
      emit(GetFavoriteFailure(fail.errMessage));
    }, (favoriteModel){
      emit(GetFavoriteSuccess(favoriteModel));
    });
  }
}
