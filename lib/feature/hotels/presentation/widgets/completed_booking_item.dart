import 'package:booking/feature/hotels/presentation/widgets/rating_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
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
      required this.endDate,
      required this.index});
  final List<HotelImages> images;
  final String price;
  final String hotelName;
  final String hotelRate;
  final String hotelAddress;
  final String startDate;
  final String endDate;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.2,
        child: index.isOdd
            ? Row(
                children: [
                  CustomImage(
                    images: images,
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  SizedBox(width: 16.w,),
                  Padding(
                    padding: const EdgeInsets.only(top: 8,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(hotelName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headline1),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(hotelAddress,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headline2),
                        ),
                        Text(
                            '${DateFormat('MMM dd').format(DateTime.parse(startDate))} - ${DateFormat('MMM dd').format(DateTime.parse(endDate))}',
                            style:
                                openSans(14.sp, Colors.grey, FontWeight.w100)),
                        Text( "people.room".tr(),
                            style:
                                openSans(16.sp, Colors.grey, FontWeight.w300)),
                        CustomRatingBar(rate: hotelRate),
                        Text( '$price'+ ' '+ "per.night".tr(),
                            style: Theme.of(context).textTheme.headline1),
                      ],
                    ),
                  )
                ],
              )
            : Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(hotelName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headline1),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(hotelAddress,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headline2),
                        ),
                        Text(
                            '${DateFormat('MMM dd').format(DateTime.parse(startDate))} - ${DateFormat('MMM dd').format(DateTime.parse(endDate))}',
                            style:
                                openSans(14.sp, Colors.black, FontWeight.w100)),
                        Text('1 room 2 people',
                            style:
                                openSans(14.sp, Colors.grey, FontWeight.w300)),
                        CustomRatingBar(rate: hotelRate),
                        Text( '$price'+ ' '+ "per.night".tr(),
                            style: Theme.of(context).textTheme.headline1),
                      ],
                    ),
                  ),
                                    SizedBox(width: 16.w,),

                  CustomImage(
                    images: images,
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                ],
              ));
  }
}
