import 'package:booking/core/util/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/util/widget_functions.dart';
ThemeData darkTheme = ThemeData(
  primarySwatch: defaultColor,
  
  scaffoldBackgroundColor: darkScafoldColor,
  
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    // systemOverlayStyle: SystemUiOverlayStyle(
    //   statusBarColor: const Color(0xff1a1a1a),
    //   statusBarIconBrightness: Brightness.light,
    // ),
    backgroundColor: const Color(0xff1a1a1a),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: darkGrey,
  ),
  textTheme:  TextTheme(
    bodyText2: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyText1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    subtitle1: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      height: 1.3,
    ),
        headline1:openSans( 18.sp, Colors.white, FontWeight.bold),
     headline2:openSans( 16.sp, Colors.white, FontWeight.w300),
             headline3: openSans(14.sp, Colors.white, FontWeight.w100),
             headline4: openSans(14.sp, Colors.white, FontWeight.w400),


  ),
);

ThemeData lightTheme = ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: whiteScafoldColor,
  appBarTheme: const AppBarTheme(
    actionsIconTheme: IconThemeData(color: Colors.black),
    titleSpacing: 20.0,
  
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: Colors.white,
  ),
  textTheme:  TextTheme(
    bodyText2: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyText1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    subtitle1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      height: 1.3,
    ),

    headline1:openSans( 18.sp, Colors.black, FontWeight.bold),
    headline2: openSans( 16.sp, Colors.black, FontWeight.w300),
        headline3: openSans(14.sp, Colors.black, FontWeight.w100),
                     headline4: openSans(14.sp, Colors.black, FontWeight.w400),


  ),
);
