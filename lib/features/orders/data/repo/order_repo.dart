import 'package:dartz/dartz.dart';
import 'package:our_store/core/errors/failures.dart';
import 'package:our_store/features/orderDetails/data/models/OrderDetailsModel.dart';
import 'package:our_store/features/orders/data/models/OrderModel.dart';

abstract class OrderRepo{
  Future<void> postOrder({required int? addressId,required int? paymentMethod});
  Future<Either<Failure,OrderModel>> getOrder();
  Future<Either<Failure,OrderDetailsModel>> getOrderDetails({required int? orderId});
}