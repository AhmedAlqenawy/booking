import 'package:booking/feature/hotels/data/data_sources/remote_datasource.dart';
import 'package:booking/feature/hotels/domain/entities/trip.dart';
import 'package:booking/core/error/exceptions.dart';
import 'package:booking/feature/hotels/domain/repositories/booking_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/util/network/network_info.dart';
import '../models/trip_model.dart';

class BookingRepositoryImp extends BookingRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  BookingRepositoryImp(this.remoteDataSource, this.networkInfo);
  @override
  Future<Either<Failure, TripModel>> getCanceledBooking() async {
    if (await networkInfo.isConnected) {
      try {
        final bookingHotel = await remoteDataSource.getCanceledBooking();
        return Right(bookingHotel);
      } on PrimaryServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
 Future<Either<Failure, Trip>> getCompeletedBooking() async {
    if (await networkInfo.isConnected) {
      try {
        final bookingHotel = await remoteDataSource.getCompletedBooking();
        return Right(bookingHotel);
      } on PrimaryServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
Future<Either<Failure, Trip>> getUpcommingBooking() async {
    if (await networkInfo.isConnected) {
      try {
        final bookingHotel = await remoteDataSource.getUpcommingBooking();
        return Right(bookingHotel);
      } on PrimaryServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
  
  @override
  Future<Either<Failure, Trip>> bookHotelRoom() {
    // TODO: implement bookHotelRoom
    throw UnimplementedError();
  }
}
