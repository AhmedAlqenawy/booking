import 'package:booking/core/util/widget_functions.dart';
import 'package:booking/feature/allhotels/domian/entity/hotel_model.dart';
import 'package:booking/feature/hotels/presentation/cubit/hotels_cubit.dart';
import 'package:booking/feature/hotels/presentation/widgets/rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/blocs/app/cubit.dart';
import '../../../../core/util/widgets/default_button.dart';
import '../../../about/model/profile_model.dart';
import '../../../hotels/domain/entities/trip.dart';

class HotailDetailsContainer extends StatelessWidget {
  const HotailDetailsContainer({super.key, required this.hotel, required this.userId});
  final HotelModel hotel;
  final int userId;
  @override
  Widget build(BuildContext context) {
                ProfileModel? profileModel = AppBloc.get(context).profileModel;

    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.22,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.black.withOpacity(0.5)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text(
                hotel.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: openSans(20.sp, Colors.white, FontWeight.bold),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Text(
                    hotel.address,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: openSans(14.sp, Colors.white, FontWeight.w100),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '3.0km to city',
                  style: openSans(14.sp, Colors.white, FontWeight.w100),
                ),
                const Spacer(),
                Text(
                  hotel.price,
                  style: openSans(22.sp, Colors.white, FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                CustomRatingBar(rate: hotel.rate!),
                const Spacer(),
                Text(
                  '/Per night',
                  style: openSans(14.sp, Colors.white, FontWeight.w100),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Center(
              child: DefaultButton(
                height: 40.h,
                width: MediaQuery.of(context).size.width * 0.7,
                textColor: Colors.white,
                title: 'Book Now',
                bgColor: Colors.teal,
                onTap: () {
                  BlocProvider.of<HotelsCubit>(context).createBooking(
                    context: context,
                      hotelId: hotel.id,
                      userId:userId);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
