import 'package:flutter/material.dart';

import '../../../../core/util/network/local/Cach_Helper.dart';
import '../../../../core/util/widgets/formField/Form.dart';
import '../widgets/home_widget.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CacheHelper? cacheHelper;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: const HomeWidget(),
    );
  }
}
TextEditingController controller = TextEditingController();

