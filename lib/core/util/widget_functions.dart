import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:google_fonts/google_fonts.dart';

space(double h, double w) {
  return SizedBox(
    height: h,
    width: w,
  );
}

TextStyle openSans(double fontSize, Color color, FontWeight fontWeight,
    {bool underline = false,
    bool overLine = false,
    Color decorationColor = Colors.black}) {
  return GoogleFonts.openSans(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    decoration: underline != false
        ? TextDecoration.underline
        : overLine != false
            ? TextDecoration.lineThrough
            : TextDecoration.none,
    decorationColor: decorationColor,
  );
}

line(h, w, color, {hasDecoration = false, buttonPadding = 0.0}) {
  return hasDecoration == true
      ? Container(
    width: w,
    height: h,
    padding: EdgeInsets.only(bottom: buttonPadding),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.w),
      color: color,
    ),
  )
      : Container(
    width: w,
    height: h,
    color: color,
  );
}
navigateTo({required BuildContext context,required Widget widget})=> Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>widget));