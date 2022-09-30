import 'package:booking/core/util/blocs/app/cubit.dart';
import 'package:booking/core/util/blocs/app/states.dart';
import 'package:booking/feature/allhotels/presentation/widgets/filtter_widget.dart';
import 'package:booking/feature/allhotels/presentation/widgets/hotels.dart';
import 'package:booking/feature/allhotels/presentation/widgets/map_widget.dart';
import 'package:booking/feature/allhotels/presentation/widgets/pick_data_rome_widget.dart';
import 'package:booking/feature/allhotels/presentation/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelsPage extends StatefulWidget {
  const HotelsPage({Key? key}) : super(key: key);

  @override
  State<HotelsPage> createState() => _HotelsPageState();
}

class _HotelsPageState extends State<HotelsPage> {
  @override
  void initState() {
    super.initState();
    AppBloc.get(context).getAllHotels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: const Text(
          'Explore',
        ),
        actions: [
          const SizedBox(
            width: 5,
          ),
          IconButton(
              iconSize: 30,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapWidget(),
                    ));
              },
              icon: const Icon(
                Icons.map_outlined,
              )),
          const SizedBox(
            width: 5,
          ),
          IconButton(
            iconSize: 30,
            onPressed: () {
              setState(() {
                AppBloc.get(context).changeAppMode();
              });
            },
            icon: const Icon(
              Icons.brightness_1,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            SearchWidget(),
            const SizedBox(
              height: 15,
            ),
            const PickDataAndRome(),
            FiltterWidget(),
            HotelsWidget()
          ]),
        ),
      ),
    );
  }
}
