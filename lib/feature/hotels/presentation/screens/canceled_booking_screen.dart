import 'package:booking/core/util/widgets/no_data.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/widget_functions.dart';
import '../cubit/hotels_cubit.dart';
import '../widgets/canceled_booking_item.dart';
import 'booking_details_screen.dart';

class CanceledBookingScreen extends StatelessWidget {
  const CanceledBookingScreen({
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

        if (state is GetCancelledBookingLoadedState) {
          if (cubit.canceledBooking.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) => InkWell(
                  onTap: () => navigateTo(
                      context: context,
                      widget: BookingDetailsScreen(
                          userId: cubit.canceledBooking[index].user.id!,
                          type: 'cancelled',
                          bookingId: cubit.canceledBooking[index].id,
                          hotel: cubit.canceledBooking[index].hotel)),
                  child: CanceledBookingItem(
                    images: cubit.canceledBooking[index].hotel.hotelImages!,
                    price: cubit.canceledBooking[index].hotel.price!,
                    hotelName: cubit.canceledBooking[index].hotel.name!,
                    hotelRate: cubit.canceledBooking[index].hotel.rate!,
                    hotelAddress: cubit.canceledBooking[index].hotel.address!,
                    startDate: cubit.canceledBooking[index].createdAt,
                    endDate: cubit.canceledBooking[index].updatedAt,
                  ),
                ),
                itemCount: cubit.canceledBooking.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 12,
                ),
              ),
            );
          } else {
            return NoData(title: 'No canceled trips');
          }
        } else if (state is GetCancelledBookingErrorState) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(child: CircularProgressIndicator(
                          color: Colors.teal,

          ));
        }
      }),
    );
  }
}
