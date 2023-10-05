import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:our_store/core/errors/failures.dart';
import 'package:our_store/core/models/AuthModel.dart';
import 'package:our_store/core/utils/api_services.dart';
import 'package:our_store/core/utils/endpoints_api.dart';
import 'package:our_store/features/login/data/repo/login_repo.dart';

class LoginRepoImpl implements LoginRepo{
  final ApiServices _apiServices;
  LoginRepoImpl(this._apiServices);
  @override
  Future<Either<Failure, AuthModel>> sendLoginData({required String email,required String pass}) async{
    try{
      var data = await _apiServices.post(endpoint: EndPoints.Login, data: {
        'email' : email,
        'password' : pass,
      });
      AuthModel loginModel;
      try{
        loginModel = AuthModel.fromJson(data);
      }catch(e){
        loginModel = AuthModel.fromJson(data);
      }

      return right(loginModel);
    }catch(e){
      if(e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }

  }

}