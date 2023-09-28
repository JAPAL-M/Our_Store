import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:our_store/constant.dart';
import 'package:our_store/core/errors/failures.dart';
import 'package:our_store/core/utils/api_services.dart';
import 'package:our_store/core/utils/endpoints_api.dart';
import 'package:our_store/features/Address/data/models/AddressModel.dart';
import 'package:our_store/features/Address/data/repo/address_repo.dart';

class AddressRepoImpl implements AddressRepo {
  final ApiServices _apiServices;

  AddressRepoImpl(this._apiServices);

  @override
  Future<Either<Failure, AddressModel>> addAddress(
      {required String? name,
      required String? city,
      required String? region,
      required String? details,
      required String? notes,
      required double? latitude,
      required double? longitude}) async{
    try {
      var data = await _apiServices.post(endpoint: EndPoints.Address,data: {
        "name" : name,
        "city" : city,
        "region" : region,
        "details" : details,
        "notes" : notes,
        "latitude" : latitude,
        "longitude" : longitude
      });
      AddressModel addressModel;
      try {
        addressModel = AddressModel.fromJson(data);
      } catch (e) {
        addressModel = AddressModel.fromJson(data);
      }

      return right(addressModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AddressModel>> getAddress() async {
    try {
      var data = await _apiServices.get(endpoint: EndPoints.Address);
      AddressModel addressModel;
      try {
        addressModel = AddressModel.fromJson(data);
      } catch (e) {
        addressModel = AddressModel.fromJson(data);
      }

      return right(addressModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> deleteAddress({required int? idAddress}) async{
    try{
      var data = await _apiServices.delete(endpoint: '${EndPoints.Address}/$idAddress');
      return right(data);

    }catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
