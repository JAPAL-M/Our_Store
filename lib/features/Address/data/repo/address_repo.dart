import 'package:dartz/dartz.dart';
import 'package:our_store/core/errors/failures.dart';
import 'package:our_store/features/Address/data/models/AddressModel.dart';

abstract class AddressRepo {
  Future<Either<Failure, AddressModel>> getAddress();

  Future<Either<Failure, AddressModel>> addAddress({
    required String? name,
    required String? city,
    required String? region,
    required String? details,
    required String? notes,
    required double? latitude,
    required double? longitude,
  });

  Future<Either<Failure, dynamic>> deleteAddress({required int? idAddress});
}
