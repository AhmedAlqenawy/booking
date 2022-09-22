import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/hotels_cubit.dart';
import '../widgets/upcoming_booking_item.dart';

class UpCommingBookingScreen extends StatelessWidget {
  const UpCommingBookingScreen({super.key, });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:12.0,vertical: 16),
      child: BlocConsumer<HotelsCubit, HotelsState>(listener: (context, state) {
        print(state);
      }, builder: (context, state) {
        var cubit = BlocProvider.of<HotelsCubit>(context);
                print(cubit. upCommingBooking.length);

      if (cubit. upCommingBooking.isNotEmpty) {
          return ListView.separated(
            itemBuilder: (BuildContext context, int index) =>
                UpcommingBookingItem(
              images: cubit. upCommingBooking[index].hotel.hotelImages!,
              price: cubit. upCommingBooking[index].hotel.price!,
              hotelName: cubit. upCommingBooking[index].hotel.name!,
              hotelRate:cubit. upCommingBooking[index].hotel.rate!,
              hotelAddress: cubit. upCommingBooking[index].hotel.address!,
              startDate: cubit. upCommingBooking[index].createdAt,
              endDate: cubit. upCommingBooking[index].updatedAt,
            ),
            itemCount: cubit. upCommingBooking.length,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 12,
            ),
          );
        } else if(state is GetBookingErrorState){
           return Center(
            child: Text(state.message),
          );
        }
        
        else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
