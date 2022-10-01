import 'package:booking/feature/allhotels/domian/entity/hotel_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/blocs/app/cubit.dart';
import '../../../../core/util/network/local/Cach_Helper.dart';
import '../../../../core/util/network/remote/end_points.dart';
import '../../../../core/util/widget_functions.dart';
import '../../../../core/util/widgets/default_button.dart';
import '../../../about/model/profile_model.dart';
import '../../../hotels/domain/entities/trip.dart';
import '../../../hotels/presentation/cubit/hotels_cubit.dart';
import '../widgets/facilities_list.dart';
import '../widgets/hotel_detail_container.dart';

class HotelDetailsScreen extends StatefulWidget {
  const HotelDetailsScreen({super.key, required this.hotelModel});
  final HotelModel hotelModel;

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen>
    with TickerProviderStateMixin {
  var animation;
  var controller;
  bool isScrolled = false;
  ScrollController? scrollController;
  int? userId;
  @override
  void initState() {
    userId = CacheHelper.getData(key: 'userId');

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
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                padding: const EdgeInsets.only(top: 32.0, left: 16),
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
                    Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        child: Image.network(
                          '$baseApiUrl/images/${widget.hotelModel.hotelImages![0].image}',
                          fit: BoxFit.fill,
                        )),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.35,
                          child: Column(
                            children: [
                              HotailDetailsContainer(
                                hotel: widget.hotelModel,
                                userId: userId!,
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
                                  height: MediaQuery.of(context).size.height *
                                      0.055,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.black.withOpacity(0.5)),
                                  child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "more.details".tr(),
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
                    ? Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.24,
                        child: Image.network(
                          '$baseApiUrl/images/${widget.hotelModel.hotelImages![0].image}',
                          fit: BoxFit.fill,
                        ))
                    : SizedBox(),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: SizedBox(
              // height: MediaQuery.of(context).size.height * 0.8,
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200.w,
                      child: Text(
                        widget.hotelModel.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                    Text(
                      widget.hotelModel.price,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200.w,
                      child: Text(
                        widget.hotelModel.address,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "per.night".tr(),
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_pin,
                      size: 12,
                      color: Colors.teal,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    SizedBox(
                      width: 100.w,
                      child: Text(
                        '3.0km to city',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline3,
                      ),
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
                  "summary".tr(),
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 100.h,
                  child: Text(
                    widget.hotelModel.description,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "facilities".tr(),
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 10.h,
                ),
                const FacilitiesList(),
                SizedBox(
                  height: 16.h,
                ),
                widget.hotelModel.hotelImages!.isNotEmpty
                    ? Text(
                        "photos".tr(),
                        style: Theme.of(context).textTheme.headline1,
                      )
                    : const SizedBox(),
                SizedBox(
                  height: widget.hotelModel.hotelImages!.isNotEmpty ? 10.h : 0,
                ),
                widget.hotelModel.hotelImages!.isNotEmpty
                    ? SizedBox(
                        width: double.infinity,
                        height: 80.h,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 80.w,
                                height: 80.h,
                                child: Image.network(
                                  '$baseApiUrl/images/${widget.hotelModel.hotelImages![index].image}',
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 10.w,
                                ),
                            itemCount: widget.hotelModel.hotelImages!.length),
                      )
                    : const SizedBox(),
                SizedBox(height: 50.h),
                Center(
                  child: DefaultButton(
                    height: 40.h,
                    width: MediaQuery.of(context).size.width * 0.8,
                    textColor: Colors.white,
                    title: "book.now".tr(),
                    bgColor: Colors.teal,
                    onTap: () {
                      BlocProvider.of<HotelsCubit>(context).createBooking(
                          context: context,
                          hotelId: widget.hotelModel.id,
                          userId: userId!);
                    },
                  ),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
