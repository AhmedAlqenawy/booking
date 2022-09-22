import 'package:booking/core/util/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../main.dart';
import '../../../../core/util/routes.dart';

class AboutMainWidget extends StatelessWidget {
  final String name, imgUrl;

  const AboutMainWidget({Key? key, required this.name, required this.imgUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: openSans(18.sp, Colors.black, FontWeight.bold),
            ),
            space(8.h, 0),
            GestureDetector(
              onTap: () {
                NavigationContext(context).push = Routes.editAbout;
              },
              child: Text(
                "View and Edit profile",
                style:
                    openSans(15.sp, const Color(0xffc3c3c3), FontWeight.w400),
              ),
            ),
          ],
        ),
        Container(
          width: 50.w,
          height: 50.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.redAccent,
            image: DecorationImage(
              fit: BoxFit.fill,
              //image: NetworkImage(imgUrl ?? ""),
              image: AssetImage("assets/img/splash_bg.jpg"),
            ),
          ),
        )
      ],
    );
  }
}
