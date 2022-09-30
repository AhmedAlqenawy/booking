import 'package:booking/core/util/blocs/app/cubit.dart';
import 'package:booking/core/util/style/colors.dart';
import 'package:flutter/material.dart';

class MYSearchFormField extends StatelessWidget {
  MYSearchFormField({
    Key? key,
    required this.controller,
  }) : super(key: key);
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3.0,
      color: AppBloc.get(context).isDark ? darkScafoldColor : whiteScafoldColor,
      borderRadius: BorderRadius.circular(20),
      child: Center(
        child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            width: MediaQuery.of(context).size.width / 1.4,
            height: MediaQuery.of(context).size.height / 13,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: TextFormField(
                cursorColor: Colors.teal,
                controller: controller,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: 'Cairo',
                    hintStyle: TextStyle(color: defaultColor),
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            )),
      ),
    );
  }
}
