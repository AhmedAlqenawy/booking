// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/util/network/remote/end_points.dart';
import '../../domain/entities/trip.dart';

class ImagesSlider extends StatefulWidget {
  List<HotelImages>? images = [];

  List<String>? imagePath;
  ImagesSlider({super.key, this.images, this.imagePath});

  @override
  State<ImagesSlider> createState() => _ImagesSliderState();
}

class _ImagesSliderState extends State<ImagesSlider> {
  int current = 0;
  final CarouselController controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CarouselSlider(
              items: widget.imagePath != null
                  ? widget.imagePath!
                      .map((item) => SizedBox(
                            child: Image.network(item,
                                fit: BoxFit.cover, width: 1000.0),
                          ))
                      .toList()
                  : widget.images!
                      .map((item) => SizedBox(
                            child: Image.network(
                                '$baseApiUrl/images/${item.image!}',
                                fit: BoxFit.cover,
                                width: 1000.0),
                          ))
                      .toList(),
              carouselController: controller,
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.4,
                  viewportFraction: 1,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      current = index;
                    });
                  }),
            ),
            Padding(
                  padding: const EdgeInsets.only(right:8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: widget.imagePath != null?widget.imagePath!.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (current == entry.key
                              ? Color(0xff57B098)
                              : Colors.white)),
                    ),
                  );
                }).toList():widget.images!.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (current == entry.key
                              ? Color(0xff57B098)
                              : Colors.white)),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
