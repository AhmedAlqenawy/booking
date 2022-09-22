import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../entities/trip.dart';
import '../repositories/booking_repository.dart';

class GetUpCommingUseCase {
  final BookingRepository reporsitory;
  GetUpCommingUseCase(this.reporsitory);
Future<Either<Failure, Trip>> call() async {
    return await reporsitory.getUpcommingBooking();
  }
}
