import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:our_store/features/cart/data/repo/cart_repo.dart';
import 'package:our_store/features/cart/presentation/viewmodel/AddAndGetCart_Cubit/cart_cubit.dart';
import 'package:our_store/features/home/data/models/HomeModel.dart';
import '../../../data/models/CartModel.dart';

part 'update_cart_state.dart';

class UpdateCartCubit extends Cubit<UpdateCartState> {
  UpdateCartCubit(this._cartRepo) : super(UpdateCartInitial());
  static UpdateCartCubit get(context) => BlocProvider.of(context);
 final CartRepo _cartRepo;
  Future<void> updateQuantity({required int? quantity,required int? id,context})async{
    emit(CartUpdateLoading());
    var data = await _cartRepo.updateQuantity(quantity: quantity,id: id);
    data.fold((faill){
      emit(CartUpdateFailure(faill.errMessage));
    }, (products){
      products.forEach((element) {
        price.update(element.id!.toInt(), (value) => element.product!.price!.toInt());
        quantityProduct.update(element.id!.toInt(), (value) => element.quantity!.toInt());
      });
      emit(CartUpdateSuccess(products));
    });
  }

  void add(context,CartItems? cartItems,CartModel cartModel)async{
    emit(UpdateCarLoading());
    cartItems?.quantity = (cartItems.quantity! + 1);
   await updateQuantity(quantity: cartItems!.quantity!.toInt(), id: cartItems.id!.toInt()).then((value){
     updateTotalPrice(cartModel.data!.cartItems!,context);
     emit(UpdateCartSuccess());
    });
  }

  void remove(context,CartItems? cartItems,CartModel cartModel)async{
    emit(UpdateCarLoading());
    if(cartItems!.quantity! > 1) {
      cartItems.quantity = (cartItems.quantity! - 1);
      await updateQuantity(quantity: cartItems.quantity!.toInt(),id: cartItems.id!.toInt()).then((
          value) {
        updateTotalPrice(cartModel.data!.cartItems!,context);
        emit(RemoveToCartSuccess());
      });
    }
  }

  Map<int,int> price = {};
  Map<int,int> quantityProduct = {};
  int total = 0;
  void updateTotalPrice(List<CartItems> cart,context){
    emit(GetTotalPriceSuccess());
    total = 0;
    for(int i = 0; i < cart.length ; i++){
      total = total + ((price[cart[i].id])!.toInt() * quantityProduct[cart[i].id]!.toInt());
    }
    emit(GetTotalPriceSuccess());
  }



}
