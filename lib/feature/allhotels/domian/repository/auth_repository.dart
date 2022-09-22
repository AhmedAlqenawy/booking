import 'package:booking/core/error/exceptions.dart';
import 'package:booking/feature/allhotels/data/models/hotels_model.dart';
import 'package:dartz/dartz.dart';

abstract class HotelsRepository {
  Future<Either<PrimaryServerException, HotelsModel>> getHotels({
    required int page,
  });
}
