
// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:booking/feature/hotels/domain/entities/trip.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/util/network/remote/end_points.dart';

class ImagesSlider extends StatelessWidget {
 final List<HotelImages> images;
 int _current = 0;
  final CarouselController _controller = CarouselController();

   ImagesSlider({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return  Column(children: [
        Expanded(
          child: CarouselSlider(
            items:  images
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(baseApiUrl+'/images/'+item.image!, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${images.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList(),
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  // setState(() {
                  //   _current = index;
                  // });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]
    );
  }
  // final List<Widget> imageSliders = images
  //   .map((item) => Container(
  //         child: Container(
  //           margin: EdgeInsets.all(5.0),
  //           child: ClipRRect(
  //               borderRadius: BorderRadius.all(Radius.circular(5.0)),
  //               child: Stack(
  //                 children: <Widget>[
  //                   Image.network(item, fit: BoxFit.cover, width: 1000.0),
  //                   Positioned(
  //                     bottom: 0.0,
  //                     left: 0.0,
  //                     right: 0.0,
  //                     child: Container(
  //                       decoration: BoxDecoration(
  //                         gradient: LinearGradient(
  //                           colors: [
  //                             Color.fromARGB(200, 0, 0, 0),
  //                             Color.fromARGB(0, 0, 0, 0)
  //                           ],
  //                           begin: Alignment.bottomCenter,
  //                           end: Alignment.topCenter,
  //                         ),
  //                       ),
  //                       padding: EdgeInsets.symmetric(
  //                           vertical: 10.0, horizontal: 20.0),
  //                       child: Text(
  //                         'No. ${imgList.indexOf(item)} image',
  //                         style: TextStyle(
  //                           color: Colors.white,
  //                           fontSize: 20.0,
  //                           fontWeight: FontWeight.bold,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               )),
  //         ),
  //       ))
  //   .toList();

}