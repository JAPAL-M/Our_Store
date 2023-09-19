import 'package:dartz/dartz.dart';
import 'package:our_store/core/errors/failures.dart';
import 'package:our_store/features/home/data/models/HomeModel.dart';

abstract class HomeRepo{
  Future<Either<Failure,HomeModel>> fetchHomeData();
}