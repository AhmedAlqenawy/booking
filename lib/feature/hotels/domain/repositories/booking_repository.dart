import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../entities/trip.dart';

abstract class BookingRepository {
   Future<Either<Failure,Trip>>getCanceledBooking();
Future<Either<Failure, Trip>>getCompeletedBooking();
Future<Either<Failure, Trip>>getUpcommingBooking();
Future<Either<Failure, Unit>>bookHotelRoom({required int hotelId ,required int userid});

Future<Either<Failure, Unit>>updateBookingStatus({required int bookingId ,required String type});

}