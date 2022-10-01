import 'package:flutter/material.dart';

import '../widgets/about_widget.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        resizeToAvoidBottomInset:false,
      backgroundColor:  Theme.of(context).scaffoldBackgroundColor,
      body: AboutWidget(),
    );
  }
}
