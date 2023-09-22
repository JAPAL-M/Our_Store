part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  @override
  List<Object> get props => [];
  const CartState();
}

class CartInitial extends CartState {}
class CartGetLoading extends CartState {}
class CartGetSuccess extends CartState {
  final CartModel cartModel;
  const CartGetSuccess(this.cartModel);
}
class CartGetFailure extends CartState {
  final String errmessage;
  const CartGetFailure(this.errmessage);
}
class CartAddLoading extends CartState {}
class CartAddSuccess extends CartState {
  final CartModel cartModel;
  const CartAddSuccess(this.cartModel);
}
class CartAddFailure extends CartState {
  final String errmessage;
  const CartAddFailure(this.errmessage);
}



class CartAddItemSuccess extends CartState {}
class CartRemoveItemSuccess extends CartState {}
