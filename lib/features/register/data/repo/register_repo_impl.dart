import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:our_store/core/errors/failures.dart';
import 'package:our_store/core/models/AuthModel.dart';
import 'package:our_store/core/utils/api_services.dart';
import 'package:our_store/core/utils/endpoints_api.dart';
import 'package:our_store/features/register/data/repo/register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  final ApiServices _apiServices;

  RegisterRepoImpl(this._apiServices);

  @override
  Future<Either<Failure, AuthModel>> sendRegisterData(
      {required String name, required String pass, required String email, required String phone}) async{
    try{
      var data = await _apiServices.post(endpoint: EndPoints.Register, data: {
        "email" : email,
        "phone" : phone,
        "name" : name,
        "password" : pass
      });

      AuthModel registerModel;
      try{
        registerModel = AuthModel.fromJson(data);
      }catch(e){
        registerModel = AuthModel.fromJson(data);
      }

      return right(registerModel);
    }catch(e){
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }

  }

}