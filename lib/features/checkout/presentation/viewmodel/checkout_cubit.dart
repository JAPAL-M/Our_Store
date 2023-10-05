import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());
  static CheckoutCubit get(context) => BlocProvider.of(context);

  int? payment;
  int? address;
  int? addressSelect;
  int currentStep = 0;
  void nextCurrentStep(){
    currentStep++;
    emit(CheckoutChangeCurrent());
  }

  void backCurrentStep(){
    currentStep--;
    emit(CheckoutChangeCurrent());
  }
  void choosePayment(int? value){
    payment = value;
    emit(CheckoutChoosePayment());
  }

  void chooseAddress(int? value){
    address = value;
    emit(CheckoutChooseAddress());
  }
}
