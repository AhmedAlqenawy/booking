import 'package:booking/feature/hotels/presentation/widgets/rating_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/util/blocs/app/cubit.dart';
import '../../../../core/util/style/colors.dart';
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
       Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20),
                    color:AppBloc.get(context).isDark  ?darkGrey:whiteScafoldColor
                    
                    ),
                child: Column(
                  children: [
                    CustomImage(
                      images: images,
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
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text(hotelName,
                                  maxLines: 1,
                                  style: Theme.of(context).textTheme.headline1)
                            ),
                            const Spacer(),
                            FittedBox(
                                child: Text(price,
                                    style: Theme.of(context).textTheme.headline1)),
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
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.5,
                              child: Text(hotelAddress,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                                 style: Theme.of(context).textTheme.headline2),
                            ),
                            const Spacer(),
                            FittedBox(
                                child: Text( "per.night".tr(),
                                  style: Theme.of(context).textTheme.headline2)),
                          ],
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomRatingBar(rate: hotelRate),
                        ))
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
