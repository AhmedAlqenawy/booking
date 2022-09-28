import 'package:booking/feature/hotels/presentation/screens/get_booking_screen.dart';
import 'package:booking/feature/login/presentation/login.dart';
import 'package:flutter/material.dart';

import '../../feature/about/presentation/pages/about_page.dart';
import '../../feature/about/presentation/pages/edit_about.dart';
import '../../feature/home/presentation/pages/home_page.dart';
import '../../feature/main_screen/presentation/screens/main_screen.dart';
import '../../feature/on_boarding/on_boarding_page.dart';
import '../../feature/splash/presentation/pages/splash_page.dart';

class Routes {
  static const String home = '/home';
  static const String bookingStatus = '/bookingStatus';
  static const String splash = '/splash';
  static const String onBoarding = '/onBoarding';
  static const String about = '/AboutPage';
  static const String editAbout = '/EditAbout';
  static const String login = '/login';
  static const String mainScreen = '/mainScreen';

  static Map<String, WidgetBuilder> get routes {
    return {
      splash: (context) => const SplashPage(),
      onBoarding: (context) => const OnBoarding(),
      login: (context) => LoginScreen(),
      home: (context) => const HomePage(),
      bookingStatus: (context) => const GetBookingScreen(item: 0,),
      about: (context) => const AboutPage(),
      editAbout: (context) => const EditAbout(),
      mainScreen: (context) =>const  MainScreen(),
    };
  }
}
