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
import 'package:our_store/features/cart/data/models/CartTotalPriceModel.dart';
import 'package:our_store/features/cart/data/repo/cart_repo.dart';
import 'package:our_store/features/home/data/models/HomeModel.dart';

class CartRepoImpl implements CartRepo{
  final ApiServices _apiServices;
  CartRepoImpl(this._apiServices);
  @override
  Future<Either<Failure, CartModel>> addItemToCart({required int? id}) async{
    try{
      var data = await _apiServices.post(endpoint: EndPoints.Cart, data: {
        'product_id' : id
      });
      CartModel cartModel;

      try{
       cartModel = CartModel.fromJson(data);
      }catch(e){
        cartModel = CartModel.fromJson(data);
      }

      return right(cartModel);
    }catch(e){
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CartItems>>> updateQuantity({required int? quantity,required int? id}) async{
    try{
      var data = await _apiServices.put(endpoint: '$Cart$id', data: {
        'quantity' : quantity
      });
      List<CartItems> cartItems = [];
      try{
        cartItems.add(CartItems.fromJson(data['data']['cart']));
      }catch(e){
        cartItems.add(CartItems.fromJson(data['data']['cart']));
      }
      print(data['data']['cart']);
      return right(cartItems);
    }catch(e){
      if(e is DioException){
        print(e);
        return left(ServerFailure.fromDioError(e));
      }
      print(e);
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartModel>> getItemFromCart() async{
    try{
      var data = await _apiServices.get(endpoint: EndPoints.Cart);
      CartModel cartModel;
        try {
          cartModel = CartModel.fromJson(data);
        } catch (e) {
          cartModel = CartModel.fromJson(data);
        }
      return right(cartModel);
    }catch(e){
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

}