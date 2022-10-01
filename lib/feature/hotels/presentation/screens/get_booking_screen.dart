import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/util/blocs/app/cubit.dart';
import '../../../../core/util/style/colors.dart';
import '../cubit/hotels_cubit.dart';
import 'canceled_booking_screen.dart';
import 'completed_booking_screen.dart';
import 'upcomming_booking_screen.dart';

class GetBookingScreen extends StatefulWidget {
  const GetBookingScreen({super.key, required this.item});
  final int item;

  @override
  State<GetBookingScreen> createState() => _GetBookingScreenState();
}

class _GetBookingScreenState extends State<GetBookingScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    BlocProvider.of<HotelsCubit>(context).tabController =
        TabController(length: 3, vsync: this);
    BlocProvider.of<HotelsCubit>(context).getAllUpcommingBooking();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Text("trips".tr(), style: Theme.of(context).textTheme.headline1),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
              elevation: 2,
              color: AppBloc.get(context).isDark ? darkGrey : whiteScafoldColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppBloc.get(context).isDark
                        ? darkGrey
                        : whiteScafoldColor,
                    borderRadius: BorderRadius.circular(20)),
                child: TabBar(
                  isScrollable: false,
                  controller:
                      BlocProvider.of<HotelsCubit>(context).tabController,
                  labelColor: Colors.teal,
                  indicatorColor: Colors.teal,
                  labelStyle: const TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  splashBorderRadius: BorderRadius.circular(20),
                  enableFeedback: true,
                  indicator:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  unselectedLabelColor: Colors.grey,
                  labelPadding: const EdgeInsets.all(0),
                  onTap: (i) {
                    if (i == 2) {
                      BlocProvider.of<HotelsCubit>(context)
                          .getAllCanceledBooking();
                    } else if (i == 1) {
                      BlocProvider.of<HotelsCubit>(context)
                          .getAllCompletedBooking();
                      //print('state '+state.toString());
                    } else {
                      BlocProvider.of<HotelsCubit>(context)
                          .getAllUpcommingBooking();
                    }
                  },
                  tabs:  [
                    Tab(
                      text: "upcoming".tr(),
                    ),
                    Tab(
                      text: 'finished'.tr(),
                    ),
                    Tab(
                      text: 'cancelled'.tr(),
                    ),
                  ],
                ),
              )),
        ),
        Expanded(
          child: TabBarView(
              controller: BlocProvider.of<HotelsCubit>(context).tabController,
              physics: NeverScrollableScrollPhysics(),
              children: const [
                UpCommingBookingScreen(),
                CompletedBookingScreen(),
                CanceledBookingScreen(),
              ]),
        )
      ]),
    );
  }
}
