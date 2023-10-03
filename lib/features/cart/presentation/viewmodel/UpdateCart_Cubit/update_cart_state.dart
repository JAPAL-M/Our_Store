part of 'update_cart_cubit.dart';

@immutable
abstract class UpdateCartState {}

class UpdateCartInitial extends UpdateCartState {}
class UpdateCarLoading extends UpdateCartState {}
class UpdateCartSuccess extends UpdateCartState {}
class ChangeToCartSuccess extends UpdateCartState {}
class RemoveToCartSuccess extends UpdateCartState {}
class ChangeAddTextInCartSuccess extends UpdateCartState {}
class ChangeRemoveTextInCartSuccess extends UpdateCartState {}
class GetTotalPriceSuccess extends UpdateCartState {}

class CartUpdateLoading extends UpdateCartState {}
class CartUpdateSuccess extends UpdateCartState {
  List<CartItems> cartItems = [];
  CartUpdateSuccess(this.cartItems);
}
class CartUpdateFailure extends UpdateCartState {
  final String errmessage;
  CartUpdateFailure(this.errmessage);
}
class CartGetTotalPriceLoading extends UpdateCartState {}
class CartGetTotalPriceSuccess extends UpdateCartState {
  final CartTotalPriceModel cartTotalPriceModel;
  CartGetTotalPriceSuccess(this.cartTotalPriceModel);
}
class CartGetTotalPriceFailure extends UpdateCartState {
  final String errmessage;
  CartGetTotalPriceFailure(this.errmessage);
}
