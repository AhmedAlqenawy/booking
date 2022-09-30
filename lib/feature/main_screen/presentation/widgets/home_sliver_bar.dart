import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/constants/constants.dart';
import '../../../../core/util/widget_functions.dart';
import '../../../../core/util/widgets/default_button.dart';
import '../../../allhotels/presentation/hotels_page.dart';
import '../../../hotels/presentation/widgets/images_slider.dart';

class HomeSliverBar extends StatelessWidget {
  const HomeSliverBar({super.key, required this.isScrolled});
  final bool isScrolled;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      collapsedHeight: MediaQuery.of(context).size.height * 0.2,
      expandedHeight: MediaQuery.of(context).size.height * 0.3,
      floating: true,
      pinned: true,
      primary: false,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      titleSpacing: 0.0,
      centerTitle: false,
      elevation: 0.0,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        centerTitle: false,
        titlePadding: const EdgeInsets.all(0),
        background: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            ImagesSlider(
              imagePath: homeImages,
            ),
            Positioned(
              left: 20.w,
              bottom: 20.h,
              child: DefaultButton(
                title: 'View Hotels',
                onTap: () => navigateTo(context: context, widget: HotelsPage()),
                height: 40.h,
                width: 120.w,
                bgColor: Colors.teal,
                textColor: Colors.white,
              ),
            )
          ],
        ),
        title: isScrolled
            ? ImagesSlider(
                imagePath: homeImages,
              )
            : SizedBox(),
      ),
    );
  }
}
