import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/util/blocs/app/cubit.dart';
import '../../../core/util/blocs/app/states.dart';
import '../../../core/util/widget_functions.dart';
import '../../../core/util/widgets/default_button.dart';
import '../../../core/util/widgets/formField/Form.dart';
import '../../home/presentation/pages/home_page.dart';

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
      if(state is UserRegisterSuccessState){
        print('lalalalalalaaaa');
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const HomePage()));
      }
      if(state is UserRegisterLoadingState){
         DotsIndicator(
          dotsCount: 3,
          position: currentPosition,
          decorator: DotsDecorator(
            color: Colors.black87, // Inactive color
            activeColor: Colors.redAccent,
          ),
        );
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,), onPressed: () {
          Navigator.pop(context);
        },
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children:  [

              const Padding(
                padding: EdgeInsets.all(25.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Sign up',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),),
                ),
              ),
              space(20.h, 0),
              Row(
                children:  [
                   Expanded(child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: DefaultButton(bgColor: Colors.indigo, textColor: Colors.white, title: 'FaceBook', height: 50, width: 100, onTap: () {  },),
                  )),
                  space(40.w, 20),
                   Expanded(child: Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: DefaultButton(bgColor: Colors.blue, textColor: Colors.white, title: 'Twitter', height: 50, width: 100, onTap: () {  },),
                  ))

                ],
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('or log in with email',style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey
                  ),),
                ),
              ),
              // space(10, 0),
              const Padding(
                padding: EdgeInsets.only(left: 25.0,bottom: 5),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('First name',style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey
                  ),),
                ),
              ),

              MyFormLogin(label: 'enter  first name', validation: 'required Name',  controller: controller_Fname,type: TextInputType.emailAddress,),
              space(30.h, 0),
              const Padding(
                padding: EdgeInsets.only(left: 25.0,bottom: 5,),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Last Name',style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey
                  ),),
                ),
              ),

              MyFormLogin(label: 'enter last name', validation: 'required name',  controller: controller_Lname,type: TextInputType.text,),
              space(30.h, 0),
              const Padding(
                padding: EdgeInsets.only(left: 25.0,bottom: 5),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Your email',style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey
                  ),),
                ),
              ),
              MyFormLogin(label: 'enter your email', validation: 'required email',  controller: controller_email,type: TextInputType.emailAddress,),
              space(30.h, 0),
              const Padding(
                padding: EdgeInsets.only(left: 25.0,bottom: 5,),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Password',style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey
                  ),),
                ),
              ),

              MyFormLogin(label: 'enter password', validation: 'required password',  controller: controller_password,type: TextInputType.visiblePassword,),
              space(30.h, 0),
              const Padding(
                padding: EdgeInsets.only(left: 25.0,bottom: 5,),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Confirm Password',style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey
                  ),),
                ),
              ),
              MyFormLogin(label: 'confirm password', validation: 'required password',  controller: controller_configPassword,type: TextInputType.visiblePassword,),
              space(10.h, 0),

              Padding(
                padding: EdgeInsets.only(right: 15.0,bottom: 5,),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () { },
                    child:const Text('Forgot your Password?',style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey
                    ),),
                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(right: 25,left: 25, ),
                child: DefaultButton(bgColor: const Color(0xff57B098), textColor: Colors.white, title: 'Sign UP', height: 50, width: 350, onTap: () {
                  if (formKey.currentState!.validate()) {
                    AppBloc.get(context).userSignUp(
                        controller_email.text,
                        controller_password.text,
                      controller_Fname.text,
                        controller_configPassword.text
                    );

                  }
                },),
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
