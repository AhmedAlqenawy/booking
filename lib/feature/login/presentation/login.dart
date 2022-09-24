import 'package:booking/core/util/widgets/formField/Form.dart';
import 'package:booking/feature/home/presentation/pages/home_page.dart';
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
import '../../../core/util/widgets/my_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController controller_email = TextEditingController();
  TextEditingController controller_password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc,  AppStates >(
  listener: (context, state) {
    if(state is UserLoginSuccessState){
      print('lalalalalalaaaa');
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
          builder: (BuildContext context) => const HomePage()));
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

      // ScaffoldMessenger.of(context).showSnackBar(
      //    SnackBar(content: Text("${state.exception.error}")),
      // );
  builder: (context, state) {
    return Scaffold(
      backgroundColor: Color(0xFFffffffff),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,

       child: Column(

         children: [
           Container(
             width: double.maxFinite,
             height: 350,
             child: Image.asset('assets/img/anim.gif'),
           ),
           Text('Welcome',style: TextStyle(fontFamily: 'AbrilFatface',fontSize: 30),),
           Column(
                  children: [

                    const Padding(
                      padding: EdgeInsets.only(left: 25.0,top: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Login',
                          style: TextStyle(fontFamily: 'AbrilFatface',fontWeight: FontWeight.bold, fontSize: 20),
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
                            width: 100, onTap: () {  }, image: 'assets/img/facebook.png',
                          ),
                        )),
                        space(40.w, 20),
                         Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: IconDButton(
                            bgColor: Colors.blue.shade400,
                            textColor: Colors.white,
                            title: 'Twitter',
                            height: 50,
                            width: 100, onTap: () {  }, image: 'assets/img/twitter.png',
                          ),
                        ))
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'or log in with email',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ),
                    ),
                    // space(10, 0),
                    const Padding(
                      padding: EdgeInsets.only(left: 25.0, bottom: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Your email',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                    ),
                    MyFormLogin(
                      label: 'enter your email',
                      validation: 'required email',
                      controller: controller_email,
                      type: TextInputType.emailAddress,
                    ),
                    space(30.h, 0),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 25.0,
                        bottom: 5,
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Password',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                    ),

                    MyFormLogin(
                      label: 'enter password',
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
                          child: const Text(
                            'Forgot your Password?',
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                     Padding(
                      padding:const EdgeInsets.only(
                        right: 25,
                        left: 25,
                      ),
                      child: DefaultButton(
                        bgColor: Color(0xff57B098),
                        textColor: Colors.white,
                        title: 'Log in',
                        height: 50,
                        width: 350, onTap: () {
                        if (_formKey.currentState!.validate()) {
                          AppBloc.get(context).userLogin(
                              controller_email,controller_password
                          );

                        }
                        AppBloc.get(context).userLogin(
                          controller_email,controller_password
                        );
                      },
                      ),
                    ),
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
