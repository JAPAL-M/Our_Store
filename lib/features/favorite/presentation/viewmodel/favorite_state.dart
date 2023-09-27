part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  @override
  List<Object> get props => [];
  const FavoriteState();
}

class FavoriteInitial extends FavoriteState {}
class AddFavoriteLoading extends FavoriteState {}
class AddFavoriteSuccess extends FavoriteState {
  final FavoriteModel favoriteModel;
  const AddFavoriteSuccess(this.favoriteModel);
}
class AddFavoriteFailure extends FavoriteState {
  final String errmessage;
  const AddFavoriteFailure(this.errmessage);
}


class GetFavoriteLoading extends FavoriteState {}
class GetFavoriteSuccess extends FavoriteState {
  final FavoriteModel favoriteModel;
  const GetFavoriteSuccess(this.favoriteModel);
}
class GetFavoriteFailure extends FavoriteState {
  final String errmessage;
  const GetFavoriteFailure(this.errmessage);
}
