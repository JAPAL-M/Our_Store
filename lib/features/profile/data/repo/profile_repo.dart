import 'package:dartz/dartz.dart';
import 'package:our_store/core/errors/failures.dart';
import 'package:our_store/core/models/AuthModel.dart';

abstract class ProfileRepo{
  Future<Either<Failure,AuthModel>> getProfile();
  Future<Either<Failure,AuthModel>> editProfile({required String? name,required String? phone,required String? email,required String? pass});
}