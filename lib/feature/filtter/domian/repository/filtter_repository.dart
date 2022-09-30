import 'package:booking/core/error/exceptions.dart';
import 'package:booking/feature/filtter/data/models/facilities.dart';
import 'package:booking/feature/filtter/data/models/filtter_hotels_model.dart';
import 'package:dartz/dartz.dart';


abstract class FiltterRepository {

  Future<Either<PrimaryServerException, Facilities>> getFacilities();

  Future<Either<PrimaryServerException, FiltterHotelsModel>> filtter({
    required int page,
    required double maxPrice,
    required double minPrice,
    required List  facilitiesIds,
    required int distance,
    required double latitude,
    required double longitude,
  });

  Future<Either<PrimaryServerException, FiltterHotelsModel>> search({
    required int page,
    required String name,
  });
}
