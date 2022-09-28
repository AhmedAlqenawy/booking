import 'package:booking/feature/allhotels/presentation/widgets/filtter_widget.dart';
import 'package:booking/feature/allhotels/presentation/widgets/hotels.dart';
import 'package:booking/feature/allhotels/presentation/widgets/map_widget.dart';
import 'package:booking/feature/allhotels/presentation/widgets/pick_data_rome_widget.dart';
import 'package:booking/feature/allhotels/presentation/widgets/search_widget.dart';
import 'package:flutter/material.dart';

class HotelsPage extends StatelessWidget {
  const HotelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          'Explore',
          style: TextStyle(color: Colors.black),
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
                color: Colors.black,
              ))
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
