import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({super.key, required this.rate});
  final String rate;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: RatingBar.builder(
        ignoreGestures: true,
        initialRating: double.parse(rate),
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemSize: 25,
        unratedColor: Colors.grey,
        itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.teal,
        ),
        onRatingUpdate: (rating) {
          print(rating);
        },
      ),
    );
  }
}
