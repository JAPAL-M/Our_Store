part of 'address_data_cubit.dart';

abstract class AddressDataState extends Equatable {
  @override
  List<Object> get props => [];
  const AddressDataState();
}

class AddressDataInitial extends AddressDataState {}
class GetAddressDataLoading extends AddressDataState {}
class GetAddressDataSuccess extends AddressDataState {
  final AddressModel addressModel;
  const GetAddressDataSuccess(this.addressModel);
}
class GetAddressDataFailure extends AddressDataState {
  final String errmessage;
  const GetAddressDataFailure(this.errmessage);
}

class AddAddressDataLoading extends AddressDataState {}
class AddAddressDataSuccess extends AddressDataState {
  final AddressModel addressModel;
  const AddAddressDataSuccess(this.addressModel);
}
class AddAddressDataFailure extends AddressDataState {
  final String errmessage;
  const AddAddressDataFailure(this.errmessage);
}

class DeleteAddressDataLoading extends AddressDataState {}
class DeleteAddressDataSuccess extends AddressDataState {}
class DeleteAddressDataFailure extends AddressDataState {
  final String errmessage;
  const DeleteAddressDataFailure(this.errmessage);
}
