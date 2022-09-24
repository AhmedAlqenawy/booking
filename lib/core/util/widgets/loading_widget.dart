import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Shimmer.fromColors(
                  highlightColor: Colors.black.withOpacity(.2),
                  baseColor: Colors.black.withOpacity(.1),
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    height: 130,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Shimmer.fromColors(
                            highlightColor: Colors.black.withOpacity(.2),
                            baseColor: Colors.black.withOpacity(.1),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Colors.grey,
                              ),
                              height: 10,
                              width: 60,
                            ),
                          ),
                          Shimmer.fromColors(
                            highlightColor: Colors.black.withOpacity(.2),
                            baseColor: Colors.black.withOpacity(.1),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Colors.grey,
                              ),
                              height: 10,
                              width: 40,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Shimmer.fromColors(
                            highlightColor: Colors.black.withOpacity(.2),
                            baseColor: Colors.black.withOpacity(.1),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Colors.grey,
                              ),
                              height: 10,
                              width: 40,
                            ),
                          ),
                          Shimmer.fromColors(
                            highlightColor: Colors.black.withOpacity(.2),
                            baseColor: Colors.black.withOpacity(.1),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Colors.grey,
                              ),
                              height: 10,
                              width: 40,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Shimmer.fromColors(
                        highlightColor: Colors.black.withOpacity(.2),
                        baseColor: Colors.black.withOpacity(.1),
                        child: RatingBar.builder(
                          itemSize: 20,
                          initialRating: 5,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.grey,
                          ),
                          onRatingUpdate: (double value) {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Shimmer.fromColors(
                  highlightColor: Colors.black.withOpacity(.2),
                  baseColor: Colors.black.withOpacity(.1),
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    height: 130,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Shimmer.fromColors(
                            highlightColor: Colors.black.withOpacity(.2),
                            baseColor: Colors.black.withOpacity(.1),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Colors.grey,
                              ),
                              height: 10,
                              width: 60,
                            ),
                          ),
                          Shimmer.fromColors(
                            highlightColor: Colors.black.withOpacity(.2),
                            baseColor: Colors.black.withOpacity(.1),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Colors.grey,
                              ),
                              height: 10,
                              width: 40,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Shimmer.fromColors(
                            highlightColor: Colors.black.withOpacity(.2),
                            baseColor: Colors.black.withOpacity(.1),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Colors.grey,
                              ),
                              height: 10,
                              width: 40,
                            ),
                          ),
                          Shimmer.fromColors(
                            highlightColor: Colors.black.withOpacity(.2),
                            baseColor: Colors.black.withOpacity(.1),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Colors.grey,
                              ),
                              height: 10,
                              width: 40,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Shimmer.fromColors(
                        highlightColor: Colors.black.withOpacity(.2),
                        baseColor: Colors.black.withOpacity(.1),
                        child: RatingBar.builder(
                          itemSize: 20,
                          initialRating: 5,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.grey,
                          ),
                          onRatingUpdate: (double value) {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
