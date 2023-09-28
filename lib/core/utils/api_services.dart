import 'package:dio/dio.dart';
import 'package:our_store/constant.dart';
import 'package:our_store/core/local/cache_helper.dart';

class ApiServices{
  final Dio _dio;
  final _baseurl = 'https://student.valuxapps.com/api/';
  ApiServices(this._dio);

  Future<Map<String,dynamic>> post({required String endpoint,Map<String,dynamic>? query,String lang = 'en',required Map<String,dynamic>? data,}) async{
    _dio.options.headers = {
      'lang':lang,
      'Content-Type':'application/json',
      'Authorization' : token ?? ''
    };
    var result = await _dio.post('$_baseurl$endpoint',queryParameters: query,data: data);

    return result.data;
  }

  Future<Map<String,dynamic>> put({required String endpoint,Map<String,dynamic>? query,String lang = 'en',required Map<String,dynamic>? data,}) async{
    _dio.options.headers = {
      'lang':lang,
      'Content-Type':'application/json',
      'Authorization' : CacheHelper.getData(key: 'token') ?? ''
    };
    var result = await _dio.put('$_baseurl$endpoint',queryParameters: query,data: data);
    print('$_baseurl$endpoint');

    return result.data;
  }

  Future<Map<String,dynamic>> delete({required String endpoint,String lang = 'en'}) async{
    _dio.options.headers = {
      'lang':lang,
      'Content-Type':'application/json',
      'Authorization' : token ?? ''
    };
    var result = await _dio.delete('$_baseurl$endpoint');

    return result.data;
  }

  Future<Map<String,dynamic>> get({required String endpoint,String lang = 'en'}) async{
    _dio.options.headers = {
      'lang':lang,
      'Content-Type':'application/json',
      'Authorization' : token ?? ''
    };
    var result = await _dio.get('$_baseurl$endpoint');
    return result.data;
  }
}