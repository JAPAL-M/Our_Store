import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:our_store/core/errors/failures.dart';
import 'package:our_store/core/models/AuthModel.dart';
import 'package:our_store/core/utils/api_services.dart';
import 'package:our_store/core/utils/endpoints_api.dart';
import 'package:our_store/features/profile/data/repo/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo{
  final ApiServices _apiServices;
  ProfileRepoImpl(this._apiServices);
  @override
  Future<Either<Failure, AuthModel>> editProfile({required String? name, required String? phone, required String? email, required String? pass}) async{
    try{
      var data = await _apiServices.put(endpoint: EndPoints.UpdateProfile, data: {
        "email" : email,
        "phone" : phone,
        "password" : pass,
        "name" : name,
      });
      AuthModel authModel;
      try{
        authModel = AuthModel.fromJson(data);
      }catch(e){
        authModel = AuthModel.fromJson(data);
      }

      return right(authModel);
    }catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }

  }

  @override
  Future<Either<Failure, AuthModel>> getProfile() async{
    try{
      var data = await _apiServices.get(endpoint: EndPoints.Profile);
      AuthModel authModel;
      try{
        authModel = AuthModel.fromJson(data);
      }catch(e){
        authModel = AuthModel.fromJson(data);
      }

      return right(authModel);
    }catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }

  }
  
}