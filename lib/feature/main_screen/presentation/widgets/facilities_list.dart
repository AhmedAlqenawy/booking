
import 'package:booking/feature/hotels/data/models/trip_model.dart';
import 'package:booking/feature/hotels/domain/entities/trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;
class FacilitiesList extends StatelessWidget {
  const FacilitiesList({super.key, required this.facilities});
final List<Facilities> facilities;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80.h,
      child: ListView.separated(
      scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
        return Container(
       width: 40.w,
       height: 40.h,
       decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Color((math.Random().nextDouble()*0xFFFFFF).toInt()).withOpacity(0.1)
        )
       ),
  child: Image.network(facilities[index].image!),

        );
      }, separatorBuilder: (context,index)=>const SizedBox(width: 12,), itemCount: facilities.length),
    );
  }
}