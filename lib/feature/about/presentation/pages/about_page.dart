import 'package:flutter/material.dart';

import '../../../../core/util/constants.dart';
import '../widgets/about_widget.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:  Theme.of(context).scaffoldBackgroundColor,
      body: AboutWidget(),
    );
  }
}
