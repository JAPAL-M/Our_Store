import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_store/features/cart/data/models/CartModel.dart';
import 'package:our_store/features/cart/data/repo/cart_repo.dart';
import 'package:our_store/features/home/presentation/viewmodel/Home_Cubit/home_cubit.dart';
import '../UpdateCart_Cubit/update_cart_cubit.dart';

part 'cart_state.dart';

class AddAndGetCartCubit extends Cubit<AddAndGetCartState> {
  AddAndGetCartCubit(this._cartRepo) : super(CartInitial());
  static AddAndGetCartCubit get(context) => BlocProvider.of(context);
  final CartRepo _cartRepo;


  Future<void> addItemToCart({required int? id,context})async{
    var data = await _cartRepo.addItemToCart(id: id);
    data.fold((faill){
      emit(CartAddFailure(faill.errMessage));
    }, (product){
      getItemFromCart(context);
      emit(CartAddSuccess(product));
    });
  }
  Future<void> getItemFromCart(context)async{
    var data = await _cartRepo.getItemFromCart();
    data.fold((faill){
      emit(CartGetFailure(faill.errMessage));
    }, (products){
      changeCartItemLength(products.data!.cartItems!.length, context);
      for (var element in products.data!.cartItems!) {
        UpdateCartCubit.get(context).price.addAll({
          element.id!.toInt() : element.product!.price!.toInt()
        });
        UpdateCartCubit.get(context).quantityProduct.addAll({
          element.id!.toInt() : element.quantity!.toInt()
        });
      }
      UpdateCartCubit.get(context).total = products.data!.total!.toInt();
      emit(CartGetSuccess(products));
    });
  }

  void changeCartItemLength(int num,context){
    HomeCubit.get(context).addCart = num;
    emit(CartRemoveItemSuccess());
  }
}
