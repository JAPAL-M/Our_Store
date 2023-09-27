import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:our_store/constant.dart';
import 'package:our_store/core/errors/failures.dart';
import 'package:our_store/core/utils/api_services.dart';
import 'package:our_store/core/utils/endpoints_api.dart';
import 'package:our_store/features/cart/data/models/CartModel.dart';
import 'package:our_store/features/cart/data/models/CartModel.dart';
import 'package:our_store/features/cart/data/models/CartModel.dart';
import 'package:our_store/features/cart/data/models/CartModel.dart';
import 'package:our_store/features/cart/data/models/CartModel.dart';
import 'package:our_store/features/cart/data/models/CartModel.dart';
import 'package:our_store/features/cart/data/repo/cart_repo.dart';
import 'package:our_store/features/favorite/data/models/FavoriteModel.dart';
import 'package:our_store/features/favorite/data/repo/fav_repo.dart';
import 'package:our_store/features/favorite/data/repo/fav_repo.dart';
import 'package:our_store/features/favorite/data/repo/fav_repo.dart';
import 'package:our_store/features/home/data/models/HomeModel.dart';

class FavoriteRepoImpl implements FavoriteRepo{
  final ApiServices _apiServices;
  FavoriteRepoImpl(this._apiServices);
  @override
  Future<Either<Failure, FavoriteModel>> addOrRemoveItemToFavorite({required int? id}) async{
    try{
      var data = await _apiServices.post(endpoint: EndPoints.Favorite, data: {
        'product_id' : id
      });
      FavoriteModel favoriteModel;

      try{
       favoriteModel = FavoriteModel.fromJson(data);
      }catch(e){
        favoriteModel = FavoriteModel.fromJson(data);
      }

      return right(favoriteModel);
    }catch(e){
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, FavoriteModel>> getItemFromFavorite() async{
    try{
      var data = await _apiServices.get(endpoint: EndPoints.Favorite);
      FavoriteModel favoriteModel;
        try {
          favoriteModel = FavoriteModel.fromJson(data);
        } catch (e) {
          favoriteModel = FavoriteModel.fromJson(data);
        }
      return right(favoriteModel);
    }catch(e){
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

}