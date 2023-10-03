import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:our_store/features/checkout/presentation/view/widgets/loading_view.dart';
import 'package:our_store/features/orderDetails/data/models/OrderDetailsModel.dart';
import 'package:our_store/features/orders/data/models/OrderModel.dart';
import 'package:our_store/features/orders/data/repo/order_repo.dart';

import '../../../cart/presentation/viewmodel/AddAndGetCart_Cubit/cart_cubit.dart';
import '../../../home/presentation/view/home_view.dart';
import '../../../home/presentation/viewmodel/HomeData_Cubit/hom_data_cubit.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this._orderRepo) : super(OrderInitial());
  static OrderCubit get(context) => BlocProvider.of(context);
  final OrderRepo _orderRepo;

  Future<void> postOrder({required int? addressId,required int? paymentMethod,context})async{
    emit(AddOrderLoading());
    try{
      var data = await _orderRepo.postOrder(addressId: addressId, paymentMethod: paymentMethod).then((value)async{
        await Get.offAll(const LoadingView());
      });
      emit(AddOrderSuccess());
    }catch(e){
      emit(AddOrderFailure());
    }
  }

  Future<void> getOrder() async {
    var data = await _orderRepo.getOrder();

    data.fold((l) {
      emit(GetOrderFailure(l.errMessage));
    }, (r) {
      emit(GetOrderSuccess(r));
    });
  }
}
