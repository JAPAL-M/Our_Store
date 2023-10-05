import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_store/features/Address/data/models/AddressModel.dart';
import 'package:our_store/features/Address/data/repo/address_repo.dart';

part 'address_data_state.dart';

class AddressDataCubit extends Cubit<AddressDataState> {
  AddressDataCubit(this._addressRepo) : super(AddressDataInitial());

  static AddressDataCubit get(context) => BlocProvider.of(context);
  final AddressRepo _addressRepo;

  Future<void> getAddress() async {
    var data = await _addressRepo.getAddress();

    data.fold((fail) {
      emit(GetAddressDataFailure(fail.errMessage));
    }, (addressModel) {
      emit(GetAddressDataSuccess(addressModel));
    });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController regionController = TextEditingController();

  Future<void> addAddress() async {
    var data = await _addressRepo.addAddress(name: nameController.text,
        city: cityController.text,
        region: regionController.text,
        details: detailsController.text,
        notes: notesController.text,
        latitude: 30.0616863,
        longitude: 31.3260088
    );

    data.fold((l){
      emit(AddAddressDataFailure(l.errMessage));
    }, (r){
      getAddress();
      emit(AddAddressDataSuccess(r));
    });
  }

  Future<void> deleteAddress({required int? id}) async{
    var data = await _addressRepo.deleteAddress(idAddress: id);

    data.fold((l){
      emit(DeleteAddressDataFailure(l.errMessage));
    }, (r){
      getAddress();
      emit(DeleteAddressDataSuccess());
    });
  }
}
