import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/util/network/remote/end_points.dart';
import '../../domain/entities/trip.dart';

class CustomImage extends StatelessWidget {
  const CustomImage(
      {super.key,
      required this.images,
      required this.width,
      required this.height,
      this.isRounded = true,
      this.halfRounded = false});
  final List<HotelImages> images;
  final double width;
  final double height;
  final bool isRounded;
  final bool halfRounded;
  @override
  Widget build(BuildContext context) {
    print(context.locale  ==Locale('ar'));
    return Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.horizontal(),
        ),
        child: CachedNetworkImage(
          imageBuilder: (context, imageProvider) => Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(
                    color: !isRounded ? Colors.transparent : Colors.grey),
                borderRadius: isRounded
                    ? BorderRadius.circular(20)
                    : halfRounded
                        ? BorderRadius.only(
                            topLeft: context.locale == const Locale('ar')
                                ? const Radius.circular(0)
                                : const Radius.circular(20),
                            bottomLeft: context.locale ==const Locale('ar')
                                ? const Radius.circular(0)
                                : const Radius.circular(20),
                            topRight: context.locale == const Locale('ar')
                                ? const Radius.circular(20)
                                : const Radius.circular(0),
                                bottomRight: context.locale ==const Locale('ar')
                                ? const Radius.circular(20)
                                : const Radius.circular(0),
                          )
                        : const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                image: DecorationImage(image: imageProvider, fit: BoxFit.fill)),
          ),
          imageUrl: images.isNotEmpty
              ? '$baseApiUrl/images/${images[0].image}'
              : 'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
              child:
                  CircularProgressIndicator(value: downloadProgress.progress)),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ));
  }
}
