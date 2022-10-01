import 'package:booking/core/util/blocs/app/cubit.dart';
import 'package:booking/core/util/blocs/app/states.dart';
import 'package:booking/core/util/network/remote/end_points.dart';
import 'package:booking/core/util/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchHotel extends StatelessWidget {
  SearchHotel({Key? key, required this.index}) : super(key: key);
  int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppStates>(
      builder: (context, state) {
        var cubit = AppBloc.get(context);
        return Material(
          color: AppBloc.get(context).isDark
              ? darkScafoldColor
              : whiteScafoldColor,
          elevation: 2.0,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: MediaQuery.of(context).size.height / 2.8,
            width: MediaQuery.of(context).size.width / 1.5,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  height: 130,
                  child: Image.network(
                      width: double.infinity,
                      fit: BoxFit.fill,
                      cubit.hotel[index].hotelImages!.isNotEmpty
                          ? '$baseApiUrl/images/${cubit.search[index].hotelImages![0].image}'
                          : 'http://api.mahmoudtaha.com/images/35321662903840.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            cubit.search[index].name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            cubit.search[index].price,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width:200.w,
                            child: Text(
                              cubit.search[index].address,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const Text(
                            '/per night',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      RatingBar.builder(
                        itemSize: 20,
                        initialRating: double.parse(cubit.search[index].rate),
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (double value) {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
