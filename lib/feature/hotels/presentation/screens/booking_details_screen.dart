
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/widget_functions.dart';
import '../../../../core/util/widgets/default_button.dart';
import '../../domain/entities/trip.dart';
import '../cubit/hotels_cubit.dart';
import '../widgets/images_slider.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen(
      {super.key,
      required this.hotel,
      required this.userId,
      required this.bookingId, required this.type});
  final Hotel hotel;
  final int userId;
  final int bookingId;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hotel.name!),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: ImagesSlider(images: hotel.hotelImages!)),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(hotel.description!),
                DefaultButton(
                  bgColor: Color(0xff57B098),
                  textColor: Colors.black,
                  width: 120.w,
                  height: 40.h,
                  title: "Book now",
                  onTap: () {
                    // BlocProvider.of<HotelsCubit>(context)
                    //     .createBooking(hotelId: 13, userId: 179);
                    BlocProvider.of<HotelsCubit>(context).updateBookingStatus(
                      context: context,
                        bookingId: bookingId, type: 'completed');
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: hotel.price,
                    style: openSans(20.sp, Colors.black, FontWeight.bold)),
                TextSpan(
                    text: '/per night',
                    style: openSans(16.sp, Colors.black, FontWeight.w400)),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
