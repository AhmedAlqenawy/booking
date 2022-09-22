import 'package:booking/core/util/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/blocs/app/cubit.dart';
import '../../../../core/util/blocs/app/states.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
      listener: (context, state) {
        if (state is ErrorState) {
          debugPrint(state.exception.message.toString());
          debugPrint(state.exception.error.toString());
          debugPrint(state.exception.code.toString());
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MaterialButton(
              onPressed: () {
                //AppBloc.get(context).userLogin();
              },
              child: const Text('Login'),
            ),
            MaterialButton(
              onPressed: () {},
              child: const Text('Get Profile'),
            ),
            MaterialButton(
              onPressed: () {},
              child:   Text('Get Hotels',style:openSans(20.sp, Colors.black, FontWeight.bold) ,),
            ),
          ],
        );
      },
    );
  }
}
