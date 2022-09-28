

import 'package:flutter/material.dart';

import '../../../hotels/presentation/widgets/images_slider.dart';

class HomeSliverBar extends StatelessWidget {
  const HomeSliverBar({super.key, required this.isScrolled});
  final bool isScrolled;
  @override
  Widget build(BuildContext context) {
    return        SliverAppBar(
              toolbarHeight: 100,
              collapsedHeight: MediaQuery.of(context).size.height * 0.2,
              expandedHeight: MediaQuery.of(context).size.height*0.5,
              floating: true,
              pinned: true,
              primary: false,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: true,
              titleSpacing: 0.0,
              centerTitle: false,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                centerTitle: false,
                titlePadding: const EdgeInsets.all(0),
                background: Stack(
                  children: [
                    //ImagesSlider()
               ],
                ),
                title: isScrolled?
                  Container()    : SizedBox(),
              ),
            );
  }
}