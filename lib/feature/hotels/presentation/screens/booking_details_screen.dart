import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/widget_functions.dart';
import '../../../../core/util/widgets/default_button.dart';
import '../../domain/entities/trip.dart';
import '../cubit/hotels_cubit.dart';
import '../widgets/images_slider.dart';
import 'get_booking_screen.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen(
      {super.key,
      required this.hotel,
      required this.userId,
      required this.bookingId,
      required this.type});
  final Hotel hotel;
  final int userId;
  final int bookingId;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hotel.name!,
        style: const TextStyle(color: Colors.black)),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
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
                SizedBox(
                  height: 100.h,
                  width:MediaQuery.of(context).size.width*0.9 ,
                  child: Text(hotel.description!,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                      style: openSans(16.sp, Colors.black, FontWeight.w400)),
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
          const SizedBox(
            height: 20,
          ),
          type == 'upcomming'
              ? Center(
                  child: DefaultButton(
                    bgColor: Color(0xff57B098),
                    textColor: Colors.white,
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 40.h,
                    title: "Complete reservation",
                    onTap: () {
                      // BlocProvider.of<HotelsCubit>(context)
                      //     .createBooking(hotelId: 13, userId: 179);
                      BlocProvider.of<HotelsCubit>(context).updateBookingStatus(
                          context: context,
                          bookingId: bookingId,
                          index: 1,
                          type: 'completed');
                      //navigateTo(context: context, widget: GetBookingScreen(item: 1,));
                    },
                  ),
                )
              : const SizedBox(),
          const SizedBox(
            height: 16,
          ),
          type == 'upcomming' || type == 'completed'
              ? Center(
                  child: DefaultButton(
                    textColor: Color(0xff57B098),
                    bgColor: Colors.white,
                    haveBorder: true,
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 40.h,
                    title: "Cancel reservation",
                    onTap: () {
                     
                      BlocProvider.of<HotelsCubit>(context).updateBookingStatus(
                          context: context,
                          bookingId: bookingId,
                          index: 2,
                          type: 'cancelled');
                          
                    },
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
