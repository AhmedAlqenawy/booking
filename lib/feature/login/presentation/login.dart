import 'package:booking/core/util/network/local/Cach_Helper.dart';
import 'package:booking/core/util/widgets/formField/Form.dart';
import 'package:booking/feature/RegisterScreen/presentation/Register_Screen.dart';
import 'package:booking/feature/main_screen/presentation/screens/main_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/util/blocs/app/cubit.dart';
import '../../../core/util/blocs/app/states.dart';
import '../../../core/util/widget_functions.dart';
import '../../../core/util/widgets/Icon_Botton.dart';
import '../../../core/util/widgets/default_button.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  CacheHelper? cacheHelper;

  TextEditingController controller_email = TextEditingController();

  TextEditingController controller_password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
      listener: (context, state) {
        if (state is UserLoginSuccessState) {
          print('lalalalalalaaaa');
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => MainScreen()));
        }

        if (state is ErrorState) {
          print(state.exception.error);
          print('openhanded');
          Fluttertoast.showToast(
              msg: state.exception.error,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.yellow,
              textColor: Colors.black,
              fontSize: 15.0);
        }
      },
      builder: (context, state) {
        return state.toString() == UserLoginLoadingState().toString()
            ? Center(child: const CircularProgressIndicator(color: Color(0xff57B098),))
            : Scaffold(
                backgroundColor: Color(0xFFffffffff),
                body: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          width: double.maxFinite,
                          height: 300,
                          child: Image.asset('assets/img/anim.gif'),
                        ),
                        Text(
                          'login_title'.tr(),
                          style: TextStyle(
                              fontFamily: 'AbrilFatface', fontSize: 30),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 25.0, top: 10),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'login_title1'.tr(),
                                  style: const TextStyle(
                                      fontFamily: 'AbrilFatface',
                                      fontWeight: FontWeight.w200,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                            space(20.h, 0),
                            Row(
                              children: [
                                Expanded(
                                    child: Padding(
                                  padding: EdgeInsets.only(left: 20.0),
                                  child: IconDButton(
                                    bgColor: Colors.indigo,
                                    textColor: Colors.white,
                                    title: 'FaceBook',
                                    height: 50,
                                    width: 100,
                                    onTap: () {},
                                    image: 'assets/img/facebook.png',
                                  ),
                                )),
                                space(20.h, 20),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: IconDButton(
                                    bgColor: Colors.blue.shade400,
                                    textColor: Colors.white,
                                    title: 'Twitter',
                                    height: 50,
                                    width: 100,
                                    onTap: () {},
                                    image: 'assets/img/twitter.png',
                                  ),
                                ))
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'login_title2'.tr(),
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                              ),
                            ),
                            // space(10, 0),
                            Padding(
                              padding: EdgeInsets.only(left: 25.0, bottom: 5),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'login_title3'.tr(),
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ),
                            ),
                            MyFormLogin(
                              label: 'login_title4'.tr(),
                              validation: 'required email',
                              controller: controller_email,
                              type: TextInputType.emailAddress,
                            ),
                            space(30.h, 0),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 25.0,
                                bottom: 5,
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'login_title5'.tr(),
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ),
                            ),

                            MyFormLogin(
                              label: 'login_title6'.tr(),
                              validation: 'required password',
                              controller: controller_password,
                              type: TextInputType.visiblePassword,
                            ),
                            space(10.h, 0),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 15.0,
                                bottom: 5,
                              ),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: TextButton(
                                  onPressed: () {
                                    // ####################################################
                                  },
                                  child: Text(
                                    'login_button1'.tr(),
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 25,
                                left: 25,
                              ),
                              child: DefaultButton(
                                bgColor: Color(0xff57B098),
                                textColor: Colors.white,
                                title: 'login_button2'.tr(),
                                height: 50,
                                width: 350,
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    AppBloc.get(context).userLogin(
                                        controller_email.text,
                                        controller_password.text);
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 220.0),
                              child: InkWell(
                                onTap: (){
                                  navigateTo(context: context, widget: RegisterScreen());
                                },
                                child: Text(
                                  "OnBoarding_button2".tr(),
                                  style: openSans(
                                      12.sp, Colors.black45, FontWeight.w400),
                                ),
                              ),
                            ),
                            space(20.h, 0)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
