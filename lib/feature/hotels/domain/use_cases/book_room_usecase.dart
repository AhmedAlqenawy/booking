import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/trip.dart';
import '../repositories/booking_repository.dart';



class BookRoomUseCase{
  final BookingRepository reporsitory;
  BookRoomUseCase(this.reporsitory);
Future<Either<Failure,Trip>> call ()async{
 return await reporsitory.bookHotelRoom();
  }

}