part of 'cart_cubit.dart';

abstract class AddAndGetCartState extends Equatable {
  @override
  List<Object> get props => [];
  const AddAndGetCartState();
}

class CartInitial extends AddAndGetCartState {}
class CartGetLoading extends AddAndGetCartState {}
class CartGetSuccess extends AddAndGetCartState {
  final CartModel cartModel;
  const CartGetSuccess(this.cartModel);
}
class CartGetFailure extends AddAndGetCartState {
  final String errmessage;
  const CartGetFailure(this.errmessage);
}
class CartAddLoading extends AddAndGetCartState {}
class CartAddSuccess extends AddAndGetCartState {
  final CartModel cartModel;
  const CartAddSuccess(this.cartModel);
}
class CartAddFailure extends AddAndGetCartState {
  final String errmessage;
  const CartAddFailure(this.errmessage);
}




class CartAddItemSuccess extends AddAndGetCartState {}
class CartRemoveItemSuccess extends AddAndGetCartState {}
