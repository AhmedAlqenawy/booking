import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/trip.dart';
import '../repositories/booking_repository.dart';



class CreateBookingUseCase{
  final BookingRepository reporsitory;
  CreateBookingUseCase(this.reporsitory);
Future<Either<Failure,Unit>> call ({required int hotelId,required int userId})async{
 return await reporsitory.bookHotelRoom(userid: userId,hotelId: hotelId);
  }

}