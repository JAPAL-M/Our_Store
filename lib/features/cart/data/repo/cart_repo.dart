import 'package:dartz/dartz.dart';
import 'package:our_store/core/errors/failures.dart';
import 'package:our_store/features/cart/data/models/CartModel.dart';

abstract class CartRepo{
  Future<Either<Failure,CartModel>> addItemToCart({required int? id});
  Future<Either<Failure,List<CartItems>>> updateQuantity({required int? quantity,required int? id});
  Future<Either<Failure,CartModel>> getItemFromCart();
}