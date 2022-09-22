import 'package:booking/feature/hotels/presentation/widgets/custom_image.dart';
import 'package:booking/feature/hotels/presentation/widgets/rating_bar.dart';
import 'package:flutter/material.dart';
  import 'package:intl/intl.dart';
 import '../../domain/entities/trip.dart';

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
                       width: double.infinity,
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
                            style: const TextStyle(color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w900
                            ),
                            )),
                            const Spacer(),
                            FittedBox(child: Text(price,
                            style: const TextStyle(color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w900
                            ),
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
                            style: const TextStyle(color: Colors.grey,
                            fontSize: 14,
                            ),
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
