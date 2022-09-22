import 'package:booking/core/util/widget_functions.dart';
import 'package:booking/feature/about/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/blocs/app/cubit.dart';
import '../../../../core/util/blocs/app/states.dart';

class EditAboutWidget extends StatefulWidget {
  const EditAboutWidget({Key? key}) : super(key: key);

  @override
  State<EditAboutWidget> createState() => _EditAboutWidgetState();
}

class _EditAboutWidgetState extends State<EditAboutWidget> {
  @override
  void initState() {
    AppBloc.get(context).getProfileDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
      listener: (context, state) {
        if (state is ErrorState) {
          debugPrint("ErrorState ErrorState ErrorState ");
          debugPrint(state.exception.message.toString());
          debugPrint(state.exception.error.toString());
          debugPrint(state.exception.code.toString());
        }
      },
      builder: (context, state) {
        ProfileModel? profileModel = AppBloc.get(context).profileModel;
        return state == null
            ? CircularProgressIndicator()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    space(80.h, 0),
                    Center(
                      child: Container(
                        width: 80.w,
                        height: 80.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.redAccent,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            //image: NetworkImage(imgUrl ?? ""),
                            image: AssetImage("assets/img/splash_bg.jpg"),
                          ),
                        ),
                      ),
                    ),
                    space(32.h, 0),

                  ],
                ),
              );
      },
    );
  }
}
