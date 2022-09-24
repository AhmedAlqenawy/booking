import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/edit_about_widget.dart';

class EditAbout extends StatelessWidget {

  const EditAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: EditAboutWidget(),
    );
  }
}
