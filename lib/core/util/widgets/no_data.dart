
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../blocs/app/cubit.dart';

class NoData extends StatelessWidget {
  const NoData({super.key, required this.title, });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height:double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 230.h,
            width: 230.w,
            child:   AppBloc.get(context).isDark? Image.asset('assets/img/no_data1.gif'): Image.asset('assets/img/no_data.gif'),
          ),
          SizedBox(height:20.h),
          Text(title,
          style:Theme.of(context).textTheme.headline2
          )
        ],
      ),
    );
  }
}