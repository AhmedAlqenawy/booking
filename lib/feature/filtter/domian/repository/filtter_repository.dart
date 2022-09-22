import 'package:booking/core/error/exceptions.dart';
import 'package:booking/feature/filtter/data/models/filtter_hotels_model.dart';
import 'package:dartz/dartz.dart';

abstract class FiltterRepository {
  Future<Either<PrimaryServerException, FiltterHotelsModel>> filtter({
    required int page,
    required double maxPrice,
    required double minPrice,
    required int facilities0,
    required int facilities1,
    required int distance,
    required double latitude,
    required double longitude,
  });
}
