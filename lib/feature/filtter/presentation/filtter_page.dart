import 'package:booking/core/util/blocs/app/cubit.dart';
import 'package:booking/core/util/blocs/app/states.dart';
import 'package:booking/feature/filtter/presentation/widgets/distance_Widget.dart';
import 'package:booking/feature/filtter/presentation/widgets/facilities_widget.dart';
import 'package:booking/feature/filtter/presentation/widgets/rang_salider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FiltterPage extends StatefulWidget {
  FiltterPage({Key? key}) : super(key: key);

  @override
  State<FiltterPage> createState() => _FiltterPageState();
}

class _FiltterPageState extends State<FiltterPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppBloc.get(context).getAllFacilities();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            RangSliderWidget(),
            Container(
              color: Colors.grey,
              width: double.infinity,
              height: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            AppBloc.get(context).allFacilities==null?CircularProgressIndicator():const FacilitiesWidget(),
            Container(
              color: Colors.grey,
              width: double.infinity,
              height: .4,
            ),
            const SizedBox(
              height: 20,
            ),
            DistanceWidget(),
            Container(
              color: Colors.grey,
              width: double.infinity,
              height: 1,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<AppBloc, AppStates>(
          builder: (context, state) {
            return Container(
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(20)),
                child: MaterialButton(
                  onPressed: () {


                    AppBloc.get(context).getfiltterHotel(
                      startDistanc: AppBloc.get(context).startDistanc.toInt(),
                      start: AppBloc.get(context).start,
                      end: AppBloc.get(context).end,
                    );
//   AppBloc.get(context).getAllHotels();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Apply',
                    style: TextStyle(color: Colors.white),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
