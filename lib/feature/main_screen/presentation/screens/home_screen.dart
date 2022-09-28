import 'package:booking/feature/allhotels/presentation/hotels_page.dart';
import 'package:booking/feature/main_screen/presentation/screens/hotel_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/blocs/app/cubit.dart';
import '../../../../core/util/blocs/app/states.dart';
import '../../../../core/util/widget_functions.dart';
import '../../../allhotels/presentation/widgets/hotel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                navigateTo(context: context, widget: HotelsPage());
              },
              child: Text("trrryryry"),
            ),
            Text("Best Deals",
                style: openSans(18.sp, Colors.black, FontWeight.bold)),
            SizedBox(
              height: 20.h,
            ),
            BlocBuilder<AppBloc, AppStates>(
              builder: (context, state) {
                print("state2");
                print(state);
                if (state is HotelsSuccessState) {
                  return Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            navigateTo(
                              context: context,
                              widget: HotelDetailsScreen(hotelModel:AppBloc.get(context).hotel[index] ),
                            ),
                          );
                        },
                        child: Hotel(index: index),
                      ),
                      itemCount: AppBloc.get(context).hotel.length,
                    ),
                  );
                }
                else {
                  return CircularProgressIndicator();
                }
              },
            )

          ],
        ),
      ),
    );
  }
}
