import 'package:booking/feature/login/presentation/login.dart';
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
import '../../../core/util/widgets/formField/Form.dart';
import '../../main_screen/presentation/screens/main_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController controller_email = TextEditingController();
  TextEditingController controller_password = TextEditingController();
  TextEditingController controller_configPassword = TextEditingController();
  TextEditingController controller_Fname = TextEditingController();
  TextEditingController controller_Lname = TextEditingController();
  final formKey = GlobalKey<FormState>();
  double currentPosition = 0.0;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
  listener: (context, state) {
      if(state is UserRegisterSuccessState) {
          print('lalalalalalaaaa');
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => MainScreen()));
        }

        if(state is ErrorState){
        print(state.exception.error);
        print('omnufnfhdfhdffdf');
        Fluttertoast.showToast(
            msg: state.exception.error,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.yellow,
            textColor: Colors.black,
            fontSize: 15.0);
      }},

  builder: (context, state) {
    return SafeArea(
          child: Scaffold(
            body: state.toString() == UserRegisterLoadingState().toString()
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Color(0xff57B098),
                  ))
                : SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(25.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'register_title'.tr(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
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
                  padding: EdgeInsets.all(20.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('login_title2'.tr(),style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey
                    ),),
                  ),
                ),
                // space(10, 0),
                 Padding(
                  padding: EdgeInsets.only(left: 25.0,bottom: 5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('register_title1'.tr(),style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey
                    ),),
                  ),
                ),

                MyFormLogin(label: 'register_title2'.tr(), validation: 'required Name',  controller: controller_Fname,type: TextInputType.emailAddress,),
                space(30.h, 0),
                 Padding(
                  padding: EdgeInsets.only(left: 25.0,bottom: 5,),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('register_title3'.tr(),style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey
                    ),),
                  ),
                ),

                MyFormLogin(label: 'register_title4'.tr(), validation: 'required name',  controller: controller_Lname,type: TextInputType.text,),
                space(30.h, 0),
                 Padding(
                  padding: EdgeInsets.only(left: 25.0,bottom: 5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('register_title5'.tr(),style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey
                    ),),
                  ),
                ),
                MyFormLogin(label: 'register_title6'.tr(), validation: 'required email',  controller: controller_email,type: TextInputType.emailAddress,),
                space(30.h, 0),
                 Padding(
                  padding: EdgeInsets.only(left: 25.0,bottom: 5,),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('login_title5'.tr(),style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey
                    ),),
                  ),
                ),

                MyFormLogin(label: 'login_title6'.tr(), validation: 'required password', isPassword: true, controller: controller_password,type: TextInputType.visiblePassword,),
                space(30.h, 0),
                 Padding(
                  padding: EdgeInsets.only(left: 25.0,bottom: 5,),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('register_title7'.tr(),style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey
                    ),),
                  ),
                ),
                MyFormLogin(label: 'register_title7'.tr(), validation: 'required password', isPassword: true, controller: controller_configPassword,type: TextInputType.visiblePassword,),
                space(10.h, 0),

                Padding(
                  padding: EdgeInsets.only(right: 15.0,bottom: 5,),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () { },
                      child: Text('login_button1'.tr(),style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey
                      ),),
                    ),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(right: 20,left: 20, ),
                  child: DefaultButton(bgColor: const Color(0xff57B098), textColor: Colors.white, title: 'Sign UP', height: 50, width: 350, onTap: () {
                    if (formKey.currentState!.validate()) {
                      AppBloc.get(context).userSignUp(
                          controller_email.text,
                          controller_password.text,
                        controller_Fname.text,
                          controller_configPassword.text,
                      );

                    }
                  },),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 180.0),
                  child: InkWell(
                    onTap: (){
                      navigateTo(context: context, widget: LoginScreen());
                    },
                    child: Text(
                      "splash_button2".tr(),
                      style: openSans(
                          12.sp, Colors.black45, FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
        ),
      ),
    ),
          );
  },
);
  }
}
