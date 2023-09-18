import 'package:dartz/dartz.dart';
import 'package:our_store/core/errors/failures.dart';
import 'package:our_store/core/models/AuthModel.dart';

abstract class LoginRepo{
  Future<Either<Failure,AuthModel>> sendLoginData({required String email,required String pass});
}