import 'package:dio/dio.dart';

class ApiServices{
  final Dio _dio;
  final _baseurl = 'https://student.valuxapps.com/api/';
  ApiServices(this._dio);

  Future<Map<String,dynamic>> post({required String endpoint,Map<String,dynamic>? query,String lang = 'en',required Map<String,dynamic>? data,}) async{
    _dio.options.headers = {
      'lang':lang,
      'Content-Type':'application/json',
    };
    var result = await _dio.post('$_baseurl$endpoint',queryParameters: query,data: data);

    return result.data;
  }
}