import 'package:booking/core/util/constants/constants.dart';
import 'package:booking/core/util/network/local/Cach_Helper.dart';
import 'package:booking/core/util/widget_functions.dart';
import 'package:booking/feature/about/model/profile_model.dart';
import 'package:booking/feature/about/presentation/widgets/profile_item.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/blocs/app/cubit.dart';
import '../../../../core/util/blocs/app/states.dart';
import '../../../../core/util/widgets/default_button.dart';
import 'about_main_widget.dart';

class AboutWidget extends StatefulWidget {
  const AboutWidget({Key? key}) : super(key: key);

  @override
  State<AboutWidget> createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  CacheHelper? cacheHelper;
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
        return profileModel == null
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    space(50.h, 0),
                    AboutMainWidget(
                      name: profileModel.data?.name ?? "",
                      imgUrl: profileModel.data!.image == null ||
                              profileModel.data?.image ==
                                  "http://api.mahmoudtaha.com/images"
                          ? "https://cdn-icons-png.flaticon.com/512/17/17004.png"
                          : profileModel.data!.image!,
                    ),
                    space(32.h, 0),
                     ProfileItem(
                      title: "about.password".tr(),
                      icon: Icons.lock,
                    ),
                     ProfileItem(
                      title: "about.invite".tr(),
                      icon: Icons.people,
                    ),
                     ProfileItem(
                      title: "about.credit".tr(),
                      icon: Icons.calendar_view_month,
                    ),
                     ProfileItem(
                        title: "about.Help".tr(),
                        icon: IconData(
                          0xf655,
                        )),
                     ProfileItem(
                      title: "about.pay".tr(),
                      icon: Icons.payment,
                    ),
                    InkWell(
                      onTap: (){
                        if(context.locale.toString() == "ar"){
                        print(context.locale);
                        setState(() {
                          context.locale = const Locale('en');
                        });}
                        else{
                          print(context.locale);
                          setState(() {
                            context.locale = const Locale('ar');
                          });}

                        // Phoenix.rebirth(context);
                      },
                      child:  ProfileItem(
                        title: "about.lang".tr(),
                        icon: Icons.language_outlined,
                      ),
                    ),
                    Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                        Text(
                          'mode'.tr(),
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        SizedBox(
                          width: 70.w,
                          height: 50.w,
                          child: DayNightSwitcher(
                            dayBackgroundColor: Colors.teal,
                            isDarkModeEnabled: AppBloc.get(context).getMode()!,
                            onStateChanged: (value) {
                              AppBloc.get(context)
                                  .changeAppTheme(sharedValue: value);
                            },
                          ),
                        ),
                      ],
          ),
         space(100.h, 0),

                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: DefaultButton(
                        bgColor: const Color(0xff57B098),
                        textColor: Colors.white,
                        width: 300.w,
                        height: 55.h,
                        title: "about.out".tr(),
                        onTap: () {
                          signOut(context);
                        },
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
