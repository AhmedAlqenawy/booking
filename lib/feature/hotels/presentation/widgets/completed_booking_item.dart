import 'package:booking/feature/hotels/presentation/widgets/rating_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/util/network/remote/end_points.dart';
import '../../../../core/util/widget_functions.dart';
import '../../domain/entities/trip.dart';
import 'custom_image.dart';

class CompletedBookingItem extends StatelessWidget {
  const CompletedBookingItem(
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
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.2,
        child: Row(
          children: [
            CustomImage(
              images: images,
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(hotelName,
                    maxLines: 1,
                        style: openSans(18.sp, Colors.black, FontWeight.bold)),
                  ),
                  Text(hotelAddress,
                      style: openSans(16.sp, Colors.black, FontWeight.w400)),
                  Text(
                      '${DateFormat('MMM dd').format(DateTime.parse(startDate))} - ${DateFormat('MMM dd').format(DateTime.parse(endDate))}',
                      style: openSans(14.sp, Colors.grey, FontWeight.w100)),
                  Text('1 room 2 people',
                      style: openSans(16.sp, Colors.grey, FontWeight.w300)),
                  CustomRatingBar(rate: hotelRate),
                  Text(
                    '$price /per night',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w900),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
