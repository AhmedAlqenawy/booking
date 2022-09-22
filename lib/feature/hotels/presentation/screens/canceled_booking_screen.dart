import 'package:booking/feature/hotels/presentation/widgets/canceled_booking_item.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/hotels_cubit.dart';
class CanceledBookingScreen extends StatelessWidget {
  const CanceledBookingScreen({super.key, });
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:12.0,vertical: 16),
      child:           
 BlocConsumer<HotelsCubit, HotelsState>(listener: (context, state) {
        print(state);
      }, builder: (context, state) {
        var cubit = BlocProvider.of<HotelsCubit>(context);
                print(cubit. canceledBooking.length);

      if (cubit. completedBooking!.isNotEmpty) {
          return ListView.separated(
            itemBuilder: (BuildContext context, int index) =>
                CanceledBookingItem(
              images: cubit. canceledBooking[index].hotel.hotelImages!,
              price: cubit. canceledBooking[index].hotel.price!,
              hotelName: cubit. canceledBooking[index].hotel.name!,
              hotelRate:cubit. canceledBooking[index].hotel.rate!,
              hotelAddress: cubit. canceledBooking[index].hotel.address!,
              startDate: cubit. canceledBooking[index].createdAt,
              endDate: cubit. canceledBooking[index].updatedAt,
            ),
            itemCount: cubit. canceledBooking.length,
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
