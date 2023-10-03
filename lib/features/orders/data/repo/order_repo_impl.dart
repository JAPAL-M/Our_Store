import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:our_store/core/errors/failures.dart';
import 'package:our_store/core/utils/api_services.dart';
import 'package:our_store/core/utils/endpoints_api.dart';
import 'package:our_store/features/orderDetails/data/models/OrderDetailsModel.dart';
import 'package:our_store/features/orders/data/models/OrderModel.dart';
import 'package:our_store/features/orders/data/repo/order_repo.dart';

class OrderRepoImpl implements OrderRepo {
  final ApiServices _apiServices;

  OrderRepoImpl(this._apiServices);

  @override
  Future<void> postOrder(
      {required int? addressId, required int? paymentMethod}) async {
    try {
      var data = await _apiServices.post(endpoint: EndPoints.Order, data: {
        "address_id": addressId,
        "payment_method": paymentMethod,
        "use_points": 'false'
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Either<Failure, OrderModel>> getOrder() async {
    try {
      var data = await _apiServices.get(endpoint: EndPoints.Order);
      OrderModel orderModel;
      try {
        orderModel = OrderModel.fromJson(data);
      } catch (e) {
        orderModel = OrderModel.fromJson(data);
      }
      return right(orderModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, OrderDetailsModel>> getOrderDetails(
      {required int? orderId}) async {
    try {
      var data = await _apiServices.get(
          endpoint: '${EndPoints.Order}/$orderId');
      OrderDetailsModel orderDetailsModel;
      try {
        orderDetailsModel = OrderDetailsModel.fromJson(data);
      } catch (e) {
        orderDetailsModel = OrderDetailsModel.fromJson(data);
      }
      return right(orderDetailsModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
