import 'package:booking/core/util/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconDButton extends StatelessWidget {
  final void Function()? onTap;
  final Color bgColor;
  final Color textColor;
  final String title;
  final double height, width;
  final String image;

  const IconDButton({
    Key? key,
    required this.image,
    required this.onTap,
    required this.bgColor,
    required this.textColor,
    required this.title,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(32.r),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 2,
                  color: Colors.white60
              )
            ]
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5.0,right: 5),
              child: SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset(image)),
            ),
        Text(
                title,
                style: openSans(16.sp, textColor, FontWeight.w500),
              ),
          ],
        ),
      ),
    );
  }
}