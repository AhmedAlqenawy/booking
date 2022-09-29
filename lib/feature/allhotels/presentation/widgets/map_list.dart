import 'package:booking/core/util/blocs/app/cubit.dart';
import 'package:booking/core/util/blocs/app/states.dart';
import 'package:booking/core/util/network/remote/end_points.dart';
import 'package:booking/feature/hotels/presentation/widgets/rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/widget_functions.dart';

class MapListItem extends StatelessWidget {
  MapListItem({
    required this.index,
    super.key,
  });
  int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppStates>(
      builder: (context, state) {
        var cubit = AppBloc.get(context);
        return SizedBox(
          height: MediaQuery.of(context).size.height / 5,
          width: 370,
          child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      height: 130,
                      child: Image.network(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.21,
                          fit: BoxFit.cover,
                          cubit.hotel[index].hotelImages!.isNotEmpty
                              ? '$baseApiUrl/images/${cubit.hotel[index].hotelImages![0].image}'
                              : 'http://api.mahmoudtaha.com/images/35321662903840.jpg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, left: 12),
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200.w,
                              child: Text(
                                cubit.hotel[index].name,
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 200.w,
                              child: Text(
                                cubit.hotel[index].address,
                                maxLines: 1,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                            Text(
                              '${cubit.hotel[index].price} /per night',
                              style:
                                  openSans(16.sp, Colors.grey, FontWeight.w200),
                            ),
                            CustomRatingBar(rate: cubit.hotel[index].rate),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
        );
      },
    );
  }
}
