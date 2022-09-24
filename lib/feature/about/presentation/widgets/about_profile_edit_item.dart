import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/widget_functions.dart';

class EditAboutItem extends StatelessWidget {
  final String title;
  TextEditingController textEditingController;
  final FocusNode _focusNode = FocusNode();

  EditAboutItem(
      {Key? key, required this.title, required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(textEditingController.text);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(_focusNode);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: openSans(14.sp, Colors.black, FontWeight.w400),
                ),
                Container(
                  width: 200,
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    //color: Colors.black,
                  ),
                  child: TextFormField(
                    style: openSans(14.sp, Colors.black, FontWeight.w400),
                    decoration: InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        disabledBorder: InputBorder.none,
                        hintText: title,
                        hintStyle: openSans(
                            16.sp, const Color(0xffADADAD), FontWeight.w400)),
                    focusNode: _focusNode,

                    controller: textEditingController,
                    //initialValue: textEditingController.text ,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
        ),
        line(.5.h, double.maxFinite, const Color(0xffc3c3c3)),
      ],
    );
  }
}
