import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/util/widget_functions.dart';
import '../../../core/util/widgets/default_button.dart';
import '../../../core/util/widgets/formField/Form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController controller_email = TextEditingController();
  TextEditingController controller_password = TextEditingController();
  TextEditingController controller_Fname = TextEditingController();
  TextEditingController controller_Lname = TextEditingController();

  @override
  Widget build(BuildContext context) {
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

            MyFormLogin(label: 'enter last name', validation: 'required name',  controller: controller_Lname,type: TextInputType.none,),
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

            MyFormLogin(label: 'enter password', validation: 'required password',  controller: controller_password,type: TextInputType.none,),
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
              padding: EdgeInsets.only(right: 25,left: 25, ),
              child: DefaultButton(bgColor: Color(0xff57B098), textColor: Colors.white, title: 'Sign UP', height: 50, width: 350, onTap: () {  },),
            ),
          ],
        ),
      ),
    );
  }
}
