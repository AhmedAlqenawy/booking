
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/booking_repository.dart';

class UpdateBookingUsecase{
  final BookingRepository reporsitory;
  UpdateBookingUsecase(this.reporsitory);
Future<Either<Failure,Unit>> call ({required int bookingId,required String type})async{
 return await reporsitory.updateBookingStatus(bookingId: bookingId,type: type);
  }

}