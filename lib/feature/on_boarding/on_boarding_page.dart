import 'package:booking/feature/RegisterScreen/presentation/Register_Screen.dart';
import 'package:booking/feature/login/presentation/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../core/util/widget_functions.dart';
import '../../core/util/widgets/default_button.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f5f5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 630.h,
              color: const Color(0xfff6f5f5),
              width: double.maxFinite,
              padding: EdgeInsets.only(top: 40.h),
              child: IntroductionScreen(
                globalBackgroundColor: const Color(0xfff6f5f5),
               // isTopSafeArea: true,
                pages: [
                  PageViewModel(
                    titleWidget: Text(
                      "Plan your trips",
                      textScaleFactor: 1,
                      style: openSans(24.sp, Colors.black, FontWeight.bold),
                    ),
                    bodyWidget: Container(
                      width: 259.w,
                      color: const Color(0xfff6f5f5),
                      child: Text(
                        "book one of vour unique hotel to escape the ordinary",
                        textScaleFactor: 1,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: openSans(
                            16.sp, const Color(0xff6C757D), FontWeight.w300),
                      ),
                    ),
                    image: Container(
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                          color: Color(0xfff6f5f5),
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/img/onboarding/frist.png",
                              ),
                              fit: BoxFit.fill)),
                    ),
                    decoration: PageDecoration(
                      pageColor: const Color(0xfff6f5f5),
                      titlePadding: EdgeInsets.only(top: 8.0.h),
                      imagePadding:   EdgeInsets.only(top: 16.0.h),
                      bodyPadding: EdgeInsets.only(top: 16.0.h),
                      contentMargin: EdgeInsets.all(20.h),
                     // footerPadding: EdgeInsets.all(0)
                    ),
                  ),
                  PageViewModel(
                    titleWidget: Text(
                      "Find best deals",
                      textScaleFactor: 1,
                      style: openSans(24.sp, Colors.black, FontWeight.bold),
                    ),
                    bodyWidget: SizedBox(
                      width: 259.w,
                      child: Text(
                        "Find deals for any season from cosy country homes to city flats",
                        textScaleFactor: 1,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: openSans(
                            16.sp, const Color(0xff6C757D), FontWeight.w300),
                      ),
                    ),
                    image: Container(
                      //height: 10.h,
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/img/onboarding/second.png",
                              ),
                              fit: BoxFit.contain)),
                    ),
                    decoration: PageDecoration(
                        pageColor: const Color(0xfff6f5f5),
                        titlePadding: EdgeInsets.only(top: 8.0.h),
                        imagePadding: const EdgeInsets.only(top: 8.0),
                        bodyPadding: EdgeInsets.only(top: 16.0.h),
                        contentMargin: EdgeInsets.all(8.h)),
                  ),
                  PageViewModel(
                    titleWidget: Text(
                      "Best travelling all time",
                      textScaleFactor: 1,
                      style: openSans(24.sp, Colors.black, FontWeight.bold),
                    ),
                    bodyWidget: SizedBox(
                      width: 259.w,
                      child: Text(
                        "Find deals for anv season from cosv country homes to city flats",
                        textScaleFactor: 1,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: openSans(
                            16.sp, const Color(0xff6C757D), FontWeight.w300),
                      ),
                    ),
                    image: Container(
                      //height: 10.h,
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/img/onboarding/third.png",
                              ),
                              fit: BoxFit.contain)),
                    ),
                    decoration: PageDecoration(
                        pageColor: const Color(0xfff6f5f5),
                        titlePadding: EdgeInsets.only(top: 8.0.h),
                        imagePadding: const EdgeInsets.only(top: 8.0),
                        bodyPadding: EdgeInsets.only(top: 16.0.h),
                        contentMargin: EdgeInsets.all(8.h)),
                  ),
                ],
                showSkipButton: false,
                showDoneButton: false,
                showNextButton: false,
                showBackButton: false,
                /*done: Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: const Color(0xffF1B52A),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Center(
                    child: Text(
                      "get_started",
                      textScaleFactor: 1,
                      style: openSans(14.sp, Colors.white, FontWeight.bold),
                    ),
                  ),
                ),
                next: Container(
                  height: 40.h,
                  width: 160.w,
                  decoration: BoxDecoration(
                    color: const Color(0xffF1B52A),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: Text(
                      "next",
                      textScaleFactor: 1,
                      style: openSans(14.sp, Colors.white, FontWeight.bold),
                    ),
                  ),
                ),
                skip: Container(
                  height: 40.h,
                  width: 160.w,
                  decoration: BoxDecoration(
                    color: Color(0xffD5D5D5),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: Text(
                      "skip",
                      textScaleFactor: 1,
                      style: openSans(14.sp, Colors.black, FontWeight.w500),
                    ),
                  ),
                ),*/
                dotsDecorator: DotsDecorator(
                  size: const Size.square(10.0),
                  activeSize: const Size(20.0, 10.0),
                  activeColor: const Color(0xff299F79),
                  color: const Color(0xffADBBC5),
                  spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                ),
                dotsContainerDecorator: const BoxDecoration(
                  color: Color(0xfff6f5f5),
                ),
                onDone: () {},
                onSkip: () {},
              ),
            ),
            space(24.h, 0),
            DefaultButton(
              bgColor: const Color(0xff57B098),
              textColor: Colors.white,
              width: 300.w,
              height: 55.h,
              title: "Login",
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>  LoginScreen(),
                  ),
                );
              },
            ),
            space(16.h, 0),
            DefaultButton(
              bgColor: Colors.white,
              textColor: Colors.black,
              width: 300.w,
              height: 55.h,
              title: "Create account",
              onTap: () {
                 Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const RegisterScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
