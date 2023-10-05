import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());
  static AddressCubit get(context) => BlocProvider.of(context);
  bool isOpen = false;
  IconData fabIcon = Icons.edit;
  void changeBottomSheet(
    // ignore: invalid_required_positional_param
    @required bool isShow,
    // ignore: invalid_required_positional_param
    @required IconData icon,
  ) {
    isOpen = isShow;
    fabIcon = icon;
    emit(AddressOpenBottomSheet());
  }
}
