part of 'order_cubit.dart';

abstract class OrderState extends Equatable {
  @override
  List<Object> get props => [];
  const OrderState();
}

class OrderInitial extends OrderState {}
class AddOrderLoading extends OrderState {}
class AddOrderSuccess extends OrderState {}
class AddOrderFailure extends OrderState {}

class GetOrderLoading extends OrderState {}
class GetOrderSuccess extends OrderState {
  final OrderModel orderModel;
  const GetOrderSuccess(this.orderModel);
}
class GetOrderFailure extends OrderState {
  final String? errmessage;
  const GetOrderFailure(this.errmessage);
}

