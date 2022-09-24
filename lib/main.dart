import 'package:booking/feature/allhotels/presentation/hotels_page.dart';
import 'package:booking/feature/hotels/presentation/cubit/hotels_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/injection.dart';
import 'core/util/blocs/app/cubit.dart';
import 'core/util/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (context) => sl<AppBloc>()
            ..getLocation()
            ..getAllHotels(),
        ),
        BlocProvider<HotelsCubit>(
          create: (context) => sl<HotelsCubit>()..getAllUpcommingBooking(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HotelsPage(),
      ),
    );
  }
}

extension NavigationContext on BuildContext {
  get pop => Navigator.pop(this);

  set push(String page) => Navigator.pushNamed(this, page);
}
