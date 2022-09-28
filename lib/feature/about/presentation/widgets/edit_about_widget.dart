import 'package:booking/core/util/widget_functions.dart';
import 'package:booking/feature/about/model/profile_model.dart';
import 'package:booking/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/blocs/app/cubit.dart';
import '../../../../core/util/blocs/app/states.dart';
import '../../../../core/util/widgets/default_button.dart';
import 'about_profile_edit_item.dart';

class EditAboutWidget extends StatefulWidget {
  const EditAboutWidget({Key? key}) : super(key: key);

  @override
  State<EditAboutWidget> createState() => _EditAboutWidgetState();
}

class _EditAboutWidgetState extends State<EditAboutWidget> {
  late TextEditingController nameTextEditingController;
  late TextEditingController emailTextEditingController;
  late TextEditingController phoneTextEditingController;
  ProfileModel? profileModel;
  @override
  void initState() {
    nameTextEditingController = TextEditingController();
    emailTextEditingController = TextEditingController();
    phoneTextEditingController = TextEditingController();
    //AppBloc.get(context).getProfileDate();
    profileModel = AppBloc.get(context).profileModel;
    if (profileModel != null) {
      nameTextEditingController.text = profileModel!.data!.name!;
      emailTextEditingController.text = profileModel!.data!.email!;
      phoneTextEditingController.text = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
      listener: (context, state) {
        print(state);
        if (state is ErrorState) {
          debugPrint("ErrorState ErrorState ErrorState ");
          debugPrint(state.exception.message.toString());
          debugPrint(state.exception.error.toString());
          debugPrint(state.exception.code.toString());
        }
      },
      builder: (context, state) {
        return state.toString() == UpdateProfileLoadingState().toString()
            ? Center(child: const CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    space(60.h, 0),
                    GestureDetector(
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 18.r,
                        color: Colors.black,
                      ),
                      onTap: () {
                        NavigationContext(context).pop;
                      },
                    ),
                    space(16.h, 0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Edit Profile",
                          style: openSans(20.sp, Colors.black, FontWeight.bold),
                        ),
                        DefaultButton(
                          width: 80.w,
                          textColor: Colors.white,
                          bgColor: Color(0xff57B098),
                          height: 40.h,
                          title: 'Save',
                          onTap: () {
                            AppBloc.get(context).updateProfile(
                                nameTextEditingController.text,
                                emailTextEditingController.text);
                          },
                        )
                      ],
                    ),
                    space(16.h, 0),
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
                    EditAboutItem(
                      title: "User Name",
                      textEditingController: nameTextEditingController,
                    ),
                    EditAboutItem(
                      title: "Email",
                      textEditingController: emailTextEditingController,
                    ),
                    EditAboutItem(
                      title: "Phone",
                      textEditingController: phoneTextEditingController,
                    ),
                  ],
                ),
              );
      },
    );
  }
}
