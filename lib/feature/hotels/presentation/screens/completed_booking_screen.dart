import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/widget_functions.dart';
import '../../../main_screen/presentation/screens/hotel_details_screen.dart';
import '../cubit/hotels_cubit.dart';
import '../widgets/completed_booking_item.dart';
import 'booking_details_screen.dart';

class CompletedBookingScreen extends StatelessWidget {
  const CompletedBookingScreen({
    super.key,
  });
  //final List<Data> bookingList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
      child: BlocConsumer<HotelsCubit, HotelsState>(listener: (context, state) {
        print(state);
      }, builder: (context, state) {
        var cubit = BlocProvider.of<HotelsCubit>(context);

        if (state is GetCompletedBookingLoadedState) {
          if (cubit.completedBooking.isNotEmpty) {
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) => InkWell(
                onTap: () {
                  navigateTo(
                      context: context,
                      widget: BookingDetailsScreen(
                          type: 'complete',
                          userId: cubit.completedBooking[index].user.id!,
                          bookingId: cubit.completedBooking[index].id,
                          hotel: cubit.completedBooking[index].hotel));
                },
                child: CompletedBookingItem(
                  images: cubit.completedBooking[index].hotel.hotelImages!,
                  price: cubit.completedBooking[index].hotel.price!,
                  hotelName: cubit.completedBooking[index].hotel.name!,
                  hotelRate: cubit.completedBooking[index].hotel.rate!,
                  hotelAddress: cubit.completedBooking[index].hotel.address!,
                  startDate: cubit.completedBooking[index].createdAt,
                  endDate: cubit.completedBooking[index].updatedAt,
                  index: index,
                ),
              ),
              itemCount: cubit.completedBooking.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 12,
              ),
            );
          } else {
            return Center(
              child: Text('No Trips',
                  style: openSans(16.sp, Colors.black, FontWeight.w400)),
            );
          }
        } else if (state is GetBookingErrorState) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
