import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/widget_functions.dart';
import '../cubit/hotels_cubit.dart';
import '../widgets/images_slider.dart';
import '../widgets/upcoming_booking_item.dart';
import 'booking_details_screen.dart';

class UpCommingBookingScreen extends StatelessWidget {
  const UpCommingBookingScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
      child: BlocConsumer<HotelsCubit, HotelsState>(listener: (context, state) {
     
        print(state);
      }, builder: (context, state) {
        var cubit = BlocProvider.of<HotelsCubit>(context);
   if(state is GetCompletedBookingLoadingState ){
          return const Center(child: CircularProgressIndicator(),);
        }
       else if (cubit.upCommingBooking.isNotEmpty) {
          return ListView.separated(
            itemBuilder: (BuildContext context, int index) => InkWell(
              onTap: () => navigateTo(
                  context: context,
                  widget: BookingDetailsScreen(
                      bookingId: cubit.upCommingBooking[index].id,
                      hotel: cubit.upCommingBooking[index].hotel)),
              child: UpcommingBookingItem(
                images: cubit.upCommingBooking[index].hotel.hotelImages!,
                price: cubit.upCommingBooking[index].hotel.price!,
                hotelName: cubit.upCommingBooking[index].hotel.name!,
                hotelRate: cubit.upCommingBooking[index].hotel.rate!,
                hotelAddress: cubit.upCommingBooking[index].hotel.address!,
                startDate: cubit.upCommingBooking[index].createdAt,
                endDate: cubit.upCommingBooking[index].updatedAt,
              ),
            ),
            itemCount: cubit.upCommingBooking.length,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 12,
            ),
          );
        } else if (state is GetBookingErrorState) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(
            child: Text('No Trips'),
          );
        }
      }),
    );
  }
}
