import 'package:booking/core/util/constants.dart';
import 'package:booking/core/util/network/local/Cach_Helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/routes.dart';
import '../../../../core/util/widget_functions.dart';
import '../../../../core/util/widgets/default_button.dart';
import '../../../../main.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/img/splash_bg.jpg",
                ))),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 136.w,
                height: 120.h,
                decoration: const BoxDecoration(
                  //  color: Colors.white,

                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/img/icon.png",
                        ))),
              ),
              Text(
                "splash_title".tr(),
                style: openSans(20.sp, Colors.black, FontWeight.bold),
              ),
              space(16.h, 0),
              Text(
                "splash_title2".tr(),
                style: openSans(14.sp, Colors.black, FontWeight.w400),
              ),
              space(445.h, 0),
              DefaultButton(
                bgColor: const Color(0xff57B098),
                textColor: Colors.white,
                width: 300.w,
                height: 55.h,
                title: "splash_button1".tr(),
                onTap: () {
                  if (CacheHelper.getData(key: "token") != null) {
                    token=CacheHelper.getData(key: "token");
                    
                    NavigationContext(context).push = Routes.mainScreen;
                  } else {
                    if (CacheHelper.getData(key: "fristLogin") != null) {
                      NavigationContext(context).push = Routes.login;
                    }
                    else {
                      NavigationContext(context).push = Routes.onBoarding;
                    }
                  }
                  /*Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const OnBoarding(),
                    ),
                  );*/
                },
              ),
              // space(24.h, 0),
              // Text(
              //   "splash_button2".tr(),
              //   style: openSans(14.sp, Colors.white, FontWeight.w400),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
