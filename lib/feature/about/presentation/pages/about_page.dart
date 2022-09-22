import 'package:flutter/material.dart';

import '../widgets/about_widget.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AboutWidget(),
    );
  }
}
