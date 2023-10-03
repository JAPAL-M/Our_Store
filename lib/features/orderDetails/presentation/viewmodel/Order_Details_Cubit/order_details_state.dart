part of 'order_details_cubit.dart';

abstract class OrderDetailsState extends Equatable {
  @override
  List<Object> get props => [];
  const OrderDetailsState();
}

class OrderDetailsInitial extends OrderDetailsState {}

class GetOrderDetailsLoading extends OrderDetailsState {}
class GetOrderDetailsSuccess extends OrderDetailsState {
  final OrderDetailsModel orderDetailsModel;
  const GetOrderDetailsSuccess(this.orderDetailsModel);
}
class GetOrderDetailsFailure extends OrderDetailsState {
  final String? errmessage;
  const GetOrderDetailsFailure(this.errmessage);
}