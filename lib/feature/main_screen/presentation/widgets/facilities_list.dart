
import 'package:booking/feature/hotels/data/models/trip_model.dart';
import 'package:booking/feature/hotels/domain/entities/trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;
class FacilitiesList extends StatelessWidget {
  const FacilitiesList({super.key, });
  @override
  Widget build(BuildContext context) {
    List<IconData> icons=[Icons.restaurant,Icons.pool,Icons.wifi,Icons.spa,];
    int colorValue =( math.Random().nextDouble()*0xFFFFFF).toInt();
    return SizedBox(
      width: double.infinity,
      height: 50.w,
      child: ListView.separated(
      scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
        return Container(
       width: 40.w,
       height: 40.w,
       decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.teal
        )
       ),
      child: Icon(icons[index],
      color:Colors.teal,
      ),

        );
      }, separatorBuilder: (context,index)=>const SizedBox(width: 12,), itemCount: icons.length),
    );
  }
}