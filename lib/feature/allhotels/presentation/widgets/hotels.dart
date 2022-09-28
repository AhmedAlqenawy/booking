import 'package:booking/core/util/blocs/app/cubit.dart';
import 'package:booking/core/util/blocs/app/states.dart';
import 'package:booking/core/util/widgets/loading_widget.dart';
import 'package:booking/feature/allhotels/data/models/hotels_model.dart';
import 'package:booking/feature/allhotels/presentation/widgets/filttered_hotels.dart';
import 'package:booking/feature/allhotels/presentation/widgets/hotel.dart';
import 'package:booking/feature/allhotels/presentation/widgets/search_hotels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelsWidget extends StatelessWidget {
  HotelsWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppStates>(
      builder: (context, state) {
        if (state is HotelsSuccessState) {
          return SizedBox(
              height: 400,
              width: double.infinity,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemBuilder: (context, index) => Hotel(index: index),
                itemCount: AppBloc.get(context).hotel.length,
              ));
        } else if (state is FiltterSuccessState) {
          return SizedBox(
              height: 400,
              width: double.infinity,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemBuilder: (context, index) => FiltterdHotel(index: index),
                itemCount: AppBloc.get(context).filtterHotel.length,
              ));
        } else if (state is SearchSuccessState) {
          return SizedBox(
              height: 400,
              width: double.infinity,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemBuilder: (context, index) => SearchHotel(index: index),
                itemCount: AppBloc.get(context).search.length,
              ));
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}
