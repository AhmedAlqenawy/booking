import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/widget_functions.dart';
import '../../../../core/util/widgets/no_data.dart';
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
        print('upcomming state $state');
      }, builder: (context, state) {
        var cubit = BlocProvider.of<HotelsCubit>(context);
        if (state is GetUpcommingBookingLoadedState) {
          if (cubit.upCommingBooking.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) => InkWell(
                  onTap: () => navigateTo(
                      context: context,
                      widget: BookingDetailsScreen(
                          type: 'upcomming',
                          userId: cubit.upCommingBooking[index].user.id!,
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
              ),
            );
          } else {
            return NoData(title: 'No upcoming trips');
          }
        } else if (state is GetBookingErrorState) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.teal,
            ),
          );
        }
      }),
    );
  }
}
