import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/trip.dart';
import '../repositories/booking_repository.dart';



class GetCompletedUseCase{
  final BookingRepository reporsitory;
  GetCompletedUseCase(this.reporsitory);
Future<Either<Failure, Trip>> call ()async{
 return await reporsitory.getCompeletedBooking();
  }

}