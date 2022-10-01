import 'package:booking/feature/hotels/presentation/widgets/rating_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/blocs/app/cubit.dart';
import '../../../../core/util/style/colors.dart';
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
          color: AppBloc.get(context).isDark ? darkGrey : whiteScafoldColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color:
                    AppBloc.get(context).isDark ? darkGrey : whiteScafoldColor),
            child: Row(
              children: [
                CustomImage(
                  images: images,
                  halfRounded: true,
                  isRounded: false,
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.21,
                ),
                SizedBox(width: 10.w,),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(hotelName,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                           style: Theme.of(context).textTheme.headline1),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(hotelAddress,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          style: Theme.of(context).textTheme.headline2),
                      ),
                      Text(
                        '$price'+ ' '+ "per.night".tr(),
                        style:  Theme.of(context).textTheme.headline2
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
