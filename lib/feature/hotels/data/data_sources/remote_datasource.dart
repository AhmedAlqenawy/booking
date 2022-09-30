import 'package:booking/core/util/constants.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/util/network/remote/dio_helper.dart';
import '../../../../core/util/network/remote/end_points.dart';
import '../models/trip_model.dart';

abstract class RemoteDataSource {
  Future<TripModel> getCanceledBooking();
  Future<TripModel> getCompletedBooking();
  Future<TripModel> getUpcommingBooking();
  Future<Unit> createBooking({required int hotelId, required int userId});
  Future<Unit> updateBookingStatus(
      {required int bookingId, required String type});
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
  
    final booking = TripModel.fromJson(response);

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
        token:  token);
    final booking = TripModel.fromJson(response);

    return booking;
  }

  @override
  Future<TripModel> getUpcommingBooking() async {
    //type = 'upcomming';     
       print('response 333333');

    final response = await dioHelper.get(
        endPoint: getupCommingBookingEndPoint,
        data: {'type': 'upcomming', 'count': 10},
        token: token);
    final booking = TripModel.fromJson(response);

    return booking;
  }

  @override
  Future<Unit> createBooking(
      {required int hotelId, required int userId})
  async {
    final response = await dioHelper.post(
        endPoint: createBookingEndPoint,
        data: {
          'user_id': userId,
          'hotel_id': hotelId,
        },
        token:  token);
    return Future.value(unit);
  }

  @override
  Future<Unit> updateBookingStatus(
      {required int bookingId, required String type}) async {
    final response = await dioHelper.post(
        endPoint: updateBookingEndPoint,
        data: {
          'booking_id': bookingId,
          'type': type,
        },
        token:  token);
        
    return Future.value(unit);
  }
}
