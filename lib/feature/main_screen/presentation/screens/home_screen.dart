import 'package:booking/core/util/widgets/loading_widget.dart';
import 'package:booking/feature/allhotels/presentation/hotels_page.dart';
import 'package:booking/feature/main_screen/presentation/screens/hotel_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/blocs/app/cubit.dart';
import '../../../../core/util/blocs/app/states.dart';
import '../../../../core/util/widget_functions.dart';
import '../../../allhotels/presentation/widgets/hotel.dart';
import '../widgets/home_sliver_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  var animation;
  var controller;
  bool isScrolled = false;
  ScrollController? scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController!.addListener(listenToScrollChange);
    super.initState();
  }

  void listenToScrollChange() {
    if (scrollController!.offset >= 100) {
      setState(() {
        isScrolled = true;
      });
    } else {
      setState(() {
        isScrolled = false;
      });
    }
  }

  @override
  void dispose() {
    scrollController!.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      // floatHeaderSlivers: true,
      controller: scrollController,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        if (innerBoxIsScrolled) {
          /* Animation */
          controller = AnimationController(
            vsync: this,
            duration: const Duration(
              seconds: 1,
            ),
          );
          animation = Tween(
            begin: 0.0,
            end: 1.0,
          ).animate(controller);
          /* Animation */
          controller.forward();
        }
        return <Widget>[
          HomeSliverBar(
            isScrolled: isScrolled,
          )
        ];
      },

      body: Container(
        height: MediaQuery.of(context).size.height*0.4,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text("Best Deals",
                style: openSans(18.sp, Colors.black, FontWeight.bold)),
                 SizedBox(
              height: 10.h,
            ),
            BlocBuilder<AppBloc, AppStates>(
              builder: (context, state) {
                print("state2");
                print(state);
                if (state is HotelsSuccessState ||
                    state is LocationSuccessState) {
                  return Expanded(
                    child: MediaQuery.removePadding(
                      removeTop: true,
                      context: context,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            navigateTo(
                              context: context,
                              widget: HotelDetailsScreen(
                                  hotelModel: AppBloc.get(context).hotel[index]),
                            );
                          },
                          child: Hotel(index: index),
                        ),
                        itemCount: AppBloc.get(context).hotel.length,
                      ),
                    ),
                  );
                } else {
                  return const LoadingWidget();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
