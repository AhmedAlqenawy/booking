import 'package:booking/feature/allhotels/domian/entity/hotel_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/network/remote/end_points.dart';
import '../../../../core/util/widget_functions.dart';
import '../../../hotels/domain/entities/trip.dart';
import '../widgets/facilities_list.dart';
import '../widgets/hotel_detail_container.dart';

class HotelDetailsScreen extends StatefulWidget {
  const HotelDetailsScreen({super.key, required this.hotelModel});
  final Hotel hotelModel;

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen>
    with TickerProviderStateMixin {
  var animation;
  var controller;
  bool isScrolled = false;
  ScrollController? scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController!.addListener(listenToScrollChange);
    super.initState();
  }

  void listenToScrollChange() {
    if (scrollController!.offset >= 600) {
      setState(() {
        isScrolled = true;
      });
    } else {
      setState(() {
        isScrolled = false;
      });
    }
  }

  @override
  void dispose() {
    scrollController!.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: NestedScrollView(
        // floatHeaderSlivers: true,
        controller: scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          if (innerBoxIsScrolled) {
            /* Animation */
            controller = AnimationController(
              vsync: this,
              duration: const Duration(
                seconds: 1,
              ),
            );
            animation = Tween(
              begin: 0.0,
              end: 1.0,
            ).animate(controller);
            /* Animation */
            controller.forward();
          }
          return <Widget>[
            SliverAppBar(
              toolbarHeight: 100,
              collapsedHeight: MediaQuery.of(context).size.height * 0.24,
              expandedHeight: MediaQuery.of(context).size.height,
              floating: true,
              pinned: true,
              primary: false,
              leading: Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 16),
                child: Container(
                  height: 20.h,
                  width: 20.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.4)),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back)),
                ),
              ),
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: true,
              titleSpacing: 0.0,
              centerTitle: false,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                centerTitle: false,
                titlePadding: const EdgeInsets.all(0),
                background: Stack(
                  children: [
                    CachedNetworkImage(
                      imageBuilder: (context, imageProvider) => Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.fill)),
                      ),
                      imageUrl: widget.hotelModel.hotelImages!.isNotEmpty
                          ? '$baseApiUrl/images/${widget.hotelModel.hotelImages![0].image}'
                          : 'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                  value: downloadProgress.progress)),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.35,
                          child: Column(
                            children: [
                              HotailDetailsContainer(
                                hotel: widget.hotelModel,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    controller = AnimationController(
                                        vsync: this,
                                        duration: const Duration(seconds: 1));
                                    animation = Tween(begin: 0.0, end: 1.0)
                                        .animate(controller!);
                                    controller!.forward();
                                  });
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.black.withOpacity(0.5)),
                                  child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            'More Details',
                                            style: openSans(14.sp, Colors.white,
                                                FontWeight.bold),
                                          ),
                                          const Icon(
                                            Icons.keyboard_arrow_down,
                                            color: Colors.white,
                                          )
                                        ],
                                      )),
                                ),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
                title: isScrolled
                    ? CachedNetworkImage(
                        imageBuilder: (context, imageProvider) => Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.24,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.fill)),
                        ),
                        imageUrl: widget.hotelModel.hotelImages!.isNotEmpty
                            ? '$baseApiUrl/images/${widget.hotelModel.hotelImages![0].image}'
                            : 'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress)),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )
                    : SizedBox(),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.hotelModel.name!,
                          style: openSans(22.sp, Colors.white, FontWeight.bold),
                        ),
                        Text(
                          widget.hotelModel.price!,
                          style: openSans(22.sp, Colors.white, FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.hotelModel.address!,
                          style: openSans(14.sp, Colors.white, FontWeight.w100),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Icon(
                          Icons.location_pin,
                          size: 12,
                          color: Colors.teal,
                        ),
                        Text(
                          '3.0km to city',
                          style: openSans(14.sp, Colors.white, FontWeight.w100),
                        ),
                        const Spacer(),
                        Text(
                          '/Per night',
                          style: openSans(14.sp, Colors.white, FontWeight.w100),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Summary',
                      style: openSans(18.sp, Colors.white, FontWeight.bold),
                    ),
                    Text(
                      widget.hotelModel.description!,
                      style: openSans(14.sp, Colors.white, FontWeight.w100),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      'Facilities',
                      style: openSans(18.sp, Colors.white, FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    FacilitiesList(
                      facilities: widget.hotelModel.facilities!,
                    ),
                     SizedBox(
                      height: 16.h,
                    ),
                     Text(
                      'Photos',
                      style: openSans(18.sp, Colors.white, FontWeight.bold),
                    ),
                      SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 100.h,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return SizedBox(
                                height: 80.h,
                                width: 80.w,
                                child: Image.network(
                                    '$baseApiUrl/images/${widget.hotelModel.facilities![index].image!}'));
                          },
                          separatorBuilder: (context, index) => SizedBox(
                                width: 10,
                              ),
                          itemCount: widget.hotelModel.facilities!.length),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
