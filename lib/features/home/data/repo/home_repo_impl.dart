import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:our_store/core/errors/failures.dart';
import 'package:our_store/core/utils/api_services.dart';
import 'package:our_store/core/utils/endpoints_api.dart';
import 'package:our_store/features/home/data/models/HomeModel.dart';
import 'package:our_store/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo{
  final ApiServices _apiServices;
  HomeRepoImpl(this._apiServices);
  @override
  Future<Either<Failure, HomeModel>> fetchHomeData() async{
    try{
      var data = await _apiServices.get(endpoint: EndPoints.Home);
      HomeModel homeModel;
      try{
        homeModel = HomeModel.fromJson(data);
      }catch(e){
        homeModel = HomeModel.fromJson(data);
      }
      return right(homeModel);
    }catch(e){
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}