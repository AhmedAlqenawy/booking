import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/blocs/app/cubit.dart';
import '../../../../core/util/widget_functions.dart';
import '../../../allhotels/presentation/widgets/hotels.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AppBloc>(context).getAllHotels();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Best Deals",
              style: openSans(18.sp, Colors.black, FontWeight.bold)),
          SizedBox(
            height: 20.h,
          ),
          HotelsWidget()
        ],
      ),
    );
  }
}
