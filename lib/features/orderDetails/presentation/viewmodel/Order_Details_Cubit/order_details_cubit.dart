import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_store/features/orders/data/repo/order_repo.dart';

import '../../../data/models/OrderDetailsModel.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit(this._orderRepo) : super(OrderDetailsInitial());
  static OrderDetailsCubit get(context) => BlocProvider.of(context);
  final OrderRepo _orderRepo;

  Future<void> getOrderDetails({required int? orderId}) async{
    emit(GetOrderDetailsLoading());
    var data = await _orderRepo.getOrderDetails(orderId: orderId);

    data.fold((l){
      emit(GetOrderDetailsFailure(l.errMessage));
    }, (r){
      emit(GetOrderDetailsSuccess(r));
    });
  }
}
