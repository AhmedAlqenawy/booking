import 'package:booking/feature/hotels/presentation/widgets/rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../core/util/network/remote/end_points.dart';
import '../../../../core/util/widget_functions.dart';
import '../../domain/entities/trip.dart';
import 'custom_image.dart';

class UpcommingBookingItem extends StatelessWidget {
  const UpcommingBookingItem(
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
      height: MediaQuery.of(context).size.height * 0.36,
      width: double.infinity,
      child: Column(
        children: [
          Text(
              '${DateFormat('MMM dd').format(DateTime.parse(startDate))} - ${DateFormat('MMM dd').format(DateTime.parse(endDate))} , 1 room 2 people'),
          Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    CustomImage(images: images,
                    isRounded: false,
                       width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.2,
                    ),
                   Padding(
                      padding:
                          const EdgeInsets.only(left: 16.0, right: 16, top: 8),
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            FittedBox(child: Text(hotelName,
                          style: openSans(20.sp, Colors.black, FontWeight.bold)
                            )),
                            const Spacer(),
                            FittedBox(child: Text(price,
                           style: openSans(20.sp, Colors.black, FontWeight.bold)
                            )),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            FittedBox(child: Text(hotelAddress,
                            style: openSans(16.sp, Colors.grey, FontWeight.w300)  
                            )),
                            const Spacer(),
                            const FittedBox(child: Text('/Per night')),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomRatingBar(rate:hotelRate),
                      ))
            ],
                ),
              )),
        ],
      ),
    );
  }
}
