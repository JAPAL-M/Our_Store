part of 'checkout_cubit.dart';

@immutable
abstract class CheckoutState {}

class CheckoutInitial extends CheckoutState {}
class CheckoutChoosePayment extends CheckoutState {}
class CheckoutChooseAddress extends CheckoutState {}
class CheckoutChangeCurrent extends CheckoutState {}
