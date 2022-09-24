
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/util/network/network_info.dart';
import '../../domain/entities/trip.dart';
import '../../domain/repositories/booking_repository.dart';
import '../data_sources/remote_datasource.dart';
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
  Future<Either<Failure, Unit>> bookHotelRoom({required int hotelId, required int userid}) async{
  if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.createBooking(hotelId: hotelId,userId: userid);
        return Right(response);
      } on PrimaryServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
  
  @override
  Future<Either<Failure, Unit>> updateBookingStatus({required int bookingId, required String type}) async{
 if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.updateBookingStatus(bookingId: bookingId,type: type);
        return Right(response);
      } on PrimaryServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
  

}
