import 'package:dartz/dartz.dart';
import 'package:our_store/core/errors/failures.dart';
import 'package:our_store/features/cart/data/models/CartModel.dart';
import 'package:our_store/features/cart/data/models/CartModel.dart';
import 'package:our_store/features/favorite/data/models/FavoriteModel.dart';

abstract class FavoriteRepo{
  Future<Either<Failure,FavoriteModel>> addOrRemoveItemToFavorite({required int? id});
  Future<Either<Failure,FavoriteModel>> getItemFromFavorite();
}