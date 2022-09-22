import 'package:booking/feature/hotels/domain/entities/trip.dart';

import '../../../../core/util/constants.dart';
import '../../../../core/util/network/remote/dio_helper.dart';
import '../../../../core/util/network/remote/end_points.dart';
import '../models/trip_model.dart';

abstract class RemoteDataSource {
  Future<TripModel> getCanceledBooking();
  Future<TripModel> getCompletedBooking();
  Future<TripModel> getUpcommingBooking();
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final DioHelper dioHelper;

  RemoteDataSourceImpl(this.dioHelper);

  @override
  Future<TripModel> getCanceledBooking() async {
    // type = 'canceled';
    final response = await dioHelper.get(
        endPoint: getcancelledBookingEndPoint,
        data: {'type': 'canceled ', 'count': 10},
        token: token);
    final booking = TripModel.fromJson(response['data']);

    return booking;
  }

  @override
  Future<TripModel> getCompletedBooking() async {
    //type = 'completed';
    final response = await dioHelper.get(
        endPoint: getCompletedBookingEndPoint,
        data: {
          'type': 'completed ',
          'count': 10,
        },
        token: token);
    final booking = TripModel.fromJson(response['data']);

    return booking;
  }

  @override
  Future<TripModel> getUpcommingBooking() async {
    //type = 'upcomming';
    final response = await dioHelper.get(
        endPoint: getupCommingBookingEndPoint,
        data: {'type': 'upcomming  ', 'count': 10},
        token: token);
    final booking = TripModel.fromJson(response['data']);

    return booking;
  }
}
