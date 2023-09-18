import 'package:dartz/dartz.dart';
import 'package:our_store/core/errors/failures.dart';
import 'package:our_store/core/models/AuthModel.dart';

abstract class RegisterRepo{
  Future<Either<Failure,AuthModel>> sendRegisterData({required String name,required String pass,required String email,required String phone});
}