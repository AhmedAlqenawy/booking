import 'package:booking/core/util/mangerLang/manger_languge.dart';
import 'package:booking/core/util/network/local/Cach_Helper.dart';
import 'package:booking/core/util/widget_functions.dart';
import 'package:booking/feature/about/model/profile_model.dart';
import 'package:booking/feature/about/presentation/widgets/profile_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/locale.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/util/blocs/app/cubit.dart';
import '../../../../core/util/blocs/app/states.dart';
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
                      imgUrl: profileModel.data?.image ?? "",
                    ),
                    space(32.h, 0),
                    const ProfileItem(
                      title: "Change Password",
                      icon: Icons.lock,
                    ),
                    const ProfileItem(
                      title: "Invite Friend",
                      icon: Icons.people,
                    ),
                    const ProfileItem(
                      title: "Credit & Coupons",
                      icon: Icons.calendar_view_month,
                    ),
                    const ProfileItem(
                        title: "Help Center",
                        icon: IconData(
                          0xf655,
                        )),
                    const ProfileItem(
                      title: "Payment",
                      icon: Icons.payment,
                    ),
                    InkWell(
                      onTap: (){
                        context.locale = Arabic_local;
                        Phoenix.rebirth(context);
                      },
                      child:  ProfileItem(
                        title: "Language",
                        icon: Icons.language_outlined,
                      ),
                    ),
                    /*MaterialButton(
                      onPressed: () {
                     //   AppBloc.get(context).userLogin();
                      },
                      child: const Text('Login'),
                    ),
                    MaterialButton(
                      onPressed: () {
                        AppBloc.get(context).getProfileDate();
                      },
                      child: const Text('Get Profile'),
                    ),*/
                  ],
                ),
              );
      },
    );
  }
}
