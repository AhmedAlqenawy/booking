import 'package:booking/feature/hotels/presentation/widgets/completed_booking_item.dart';
import 'package:booking/feature/hotels/presentation/widgets/images_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/hotels_cubit.dart';

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

        if (cubit.completedBooking!.isNotEmpty) {
          return ListView.separated(
            itemBuilder: (BuildContext context, int index) => InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImagesSlider(
                          images: cubit
                              .completedBooking![index].hotel.hotelImages!)),
                );
              },
              child: CompletedBookingItem(
                images: cubit.completedBooking![index].hotel.hotelImages!,
                price: cubit.completedBooking![index].hotel.price!,
                hotelName: cubit.completedBooking![index].hotel.name!,
                hotelRate: cubit.completedBooking![index].hotel.rate!,
                hotelAddress: cubit.completedBooking![index].hotel.address!,
                startDate: cubit.completedBooking![index].createdAt,
                endDate: cubit.completedBooking![index].updatedAt,
              ),
            ),
            itemCount: cubit.completedBooking!.length,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 12,
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
