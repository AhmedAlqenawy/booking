import 'package:booking/core/util/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButton extends StatelessWidget {
  final void Function()? onTap;
  final Color bgColor;
  final Color textColor;
   final  bool haveBorder;

  final String title;
  final double height, width;

  const DefaultButton({
    Key? key,
    this.onTap,
    required this.bgColor,
    required this.textColor,
    required this.title,
    required this.height,
    required this.width,  this.haveBorder = false,
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

          border: Border.all(color:haveBorder? textColor:bgColor),
          boxShadow: const [
            BoxShadow(
              blurRadius: 2,
              color: Colors.white60
            )
          ]
        ),
        child: Center(
          child: Text(
            title,
            style: openSans(16.sp, textColor, FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
