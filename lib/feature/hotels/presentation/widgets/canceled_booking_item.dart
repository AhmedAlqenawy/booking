import 'package:booking/feature/hotels/presentation/widgets/rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/widget_functions.dart';
import '../../domain/entities/trip.dart';
import 'custom_image.dart';

class CanceledBookingItem extends StatelessWidget {
  const CanceledBookingItem(
      {super.key,
      required this.images,
      required this.price,
      required this.hotelName,
      required this.hotelRate,
      required this.hotelAddress,
      required this.startDate,
      required this.endDate});
  final List<HotelImages> images;
  final String price;
  final String hotelName;
  final String hotelRate;
  final String hotelAddress;
  final String startDate;
  final String endDate;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.21,
      width: double.infinity,
      child: Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                CustomImage(
                  images: images,
                  halfRounded: true,
                  isRounded: false,
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.21,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(hotelName,
                          style:
                              openSans(20.sp, Colors.black, FontWeight.bold)),
                      Text(hotelAddress),
                      Text(
                        '$price /per night',
                        style: openSans(16.sp, Colors.grey, FontWeight.w200),
                      ),
                      CustomRatingBar(rate: hotelRate),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
