import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());
  static AddressCubit get(context) => BlocProvider.of(context);
  bool isOpen = false;
  IconData fabIcon = Icons.edit;
  void changeBottomSheet(
      @required bool isShow,
      @required IconData icon,
      ){
    isOpen = isShow;
    fabIcon = icon;
    emit(AddressOpenBottomSheet());
  }
}
