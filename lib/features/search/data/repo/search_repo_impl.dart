import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:our_store/core/errors/failures.dart';
import 'package:our_store/core/utils/api_services.dart';
import 'package:our_store/core/utils/endpoints_api.dart';
import 'package:our_store/features/home/data/models/HomeModel.dart';
import 'package:our_store/features/search/data/repo/search_repo.dart';

class SearchRepoImpl implements SearchRepo{
  final ApiServices _apiServices;
  SearchRepoImpl(this._apiServices);
  @override
  Future<Either<Failure, List<Products>>> searchProduct({required String? searchText}) async{
    try{
      var result = await _apiServices.post(endpoint: EndPoints.Search, data: {
        "text" : searchText
      });
      
      List<Products> products = [];

      for(var items in result['data']['data']){
        try{
          products.add(Products.fromJson(items));
        }catch(e){
          products.add(Products.fromJson(items));
        }
      }

      return right(products);

    }catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } 
      return left(ServerFailure(e.toString()));
    }
  }
  
}