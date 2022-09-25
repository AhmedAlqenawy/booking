import 'package:flutter/material.dart';

import '../../../../core/util/widgets/formField/Form.dart';
import '../widgets/home_widget.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return  NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
          return <Widget>[
            createSilverAppBar1()
            ];

            },

      body: const HomeWidget(),
    );
  }
}
TextEditingController controller = TextEditingController();


SliverAppBar createSilverAppBar1() {
  return SliverAppBar(
    backgroundColor: Colors.redAccent,
    expandedHeight: 300,
    floating: false,
    elevation: 0,
    flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            background: Container(
              color: Colors.white,
              child: MyFormLogin(label: '', validation: '', type: TextInputType.text, controller: controller,)
            ),
          );
        }),
  );
}