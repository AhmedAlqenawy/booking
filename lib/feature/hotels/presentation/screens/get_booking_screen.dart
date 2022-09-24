import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/hotels_cubit.dart';
import 'canceled_booking_screen.dart';
import 'completed_booking_screen.dart';
import 'upcomming_booking_screen.dart';


class GetBookingScreen extends StatelessWidget {
  const GetBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title:
                const Text('My Trips', style: TextStyle(color: Colors.black)),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child:  BlocConsumer<HotelsCubit, HotelsState>(listener: (context, state) {
              print(state);
            }, builder: (context, state) {
              print(state);
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: TabBar(
                        labelColor: Colors.teal,
                        indicatorColor: Colors.teal,
                        labelStyle:  const TextStyle(color: Colors.teal,
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
                            BlocProvider.of<HotelsCubit>(context).getAllCanceledBooking();
                          } else if (i == 1) {
                            BlocProvider.of<HotelsCubit>(context)
                                .getAllCompletedBooking();
                                //print('state '+state.toString());
                          } else{
                        BlocProvider.of<HotelsCubit>(context)
                                .getAllUpcommingBooking();
                          }
                        },

                        
                         tabs: const [
                          Tab(
                            text: 'Upcoming',
                          ),
                          Tab(
                            text: 'Finished',
                          ),
                          Tab(
                            text: 'Canceled',
                          ),
                        ],
                      ),
                    );
                  }
                ),
              ),
            ),
           
                const Expanded(
                child: TabBarView(children: [
                  UpCommingBookingScreen(
                      ),
                  CompletedBookingScreen(
                      ),
                  CanceledBookingScreen(
                  ),
                ]),
               )
          ])),
    );
  }
}
