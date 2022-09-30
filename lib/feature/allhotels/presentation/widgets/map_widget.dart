import 'package:booking/core/util/blocs/app/cubit.dart';
import 'package:booking/core/util/blocs/app/states.dart';
import 'package:booking/feature/allhotels/presentation/widgets/hotel.dart';
import 'package:booking/feature/allhotels/presentation/widgets/map_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'dart:async';

class MapWidget extends StatefulWidget {
  MapWidget({Key? key}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  void initState() {
    super.initState();
    AppBloc.get(context).getAllHotels();
  }

  int x = 0;
  Future<void> _goToTheLake() async {
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(latlonglist.elementAt(x)));

    x++;
    if (x > 6) {
      x = 0;
    }
  }

  final Completer<GoogleMapController> _controller = Completer();

  List<CameraPosition> latlonglist = [
    const CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(27.049302, 33.900214),
        tilt: 59.440717697143555,
        zoom: 15.151926040649414),
    const CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(27.049302, 33.900214),
        tilt: 59.440717697143555,
        zoom: 15.151926040649414),
    const CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(27.049302, 33.900214),
        tilt: 59.440717697143555,
        zoom: 15.151926040649414),
    const CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(27.049302, 33.900214),
        tilt: 59.440717697143555,
        zoom: 15.151926040649414),
    const CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(27.150182, 33.826711),
        tilt: 59.440717697143555,
        zoom: 15.151926040649414),
    const CameraPosition(
        bearing: 192.8334901395799,
        tilt: 59.440717697143555,
        target: LatLng(27.135312, 33.8116368),
        zoom: 15.151926040649414),
    const CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(27.259102, 33.812999),
        tilt: 59.440717697143555,
        zoom: 15.151926040649414),
  ];

  final ItemScrollController itemScrollController = ItemScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: latlonglist.elementAt(x),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          BlocBuilder<AppBloc, AppStates>(
            builder: (context, state) {
              if (state is HotelsSuccessState) {
                return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.21,
                    width: double.infinity,
                    child: ScrollablePositionedList.separated(
                      itemScrollController: itemScrollController,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 20,
                      ),
                      itemBuilder: (context, index) =>
                          MapListItem(index: index),
                      itemCount: AppBloc.get(context).hotel.length,
                    ));
              } else {
                return const Text('');
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _goToTheLake();
          itemScrollController.scrollTo(
              index: x, duration: const Duration(seconds: 1));
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
