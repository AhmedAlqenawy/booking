import 'package:booking/core/util/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final IconData? icon;

  const ProfileItem({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline4,
              ),
              Icon(
                icon,
                color: const Color(0xffc3c3c3),
              )
            ],
          ),
        ),
        line(.5.h, double.maxFinite, const Color(0xffc3c3c3)),
      ],
    );
  }
}
