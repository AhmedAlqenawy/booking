import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../entities/trip.dart';

abstract class BookingRepository {
   Future<Either<Failure,Trip>>getCanceledBooking();
Future<Either<Failure, Trip>>getCompeletedBooking();
Future<Either<Failure, Trip>>getUpcommingBooking();
Future<Either<Failure, Trip>>bookHotelRoom();


}