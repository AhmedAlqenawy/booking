import 'package:booking/core/util/blocs/app/cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../about/presentation/pages/about_page.dart';
import '../../../hotels/presentation/screens/get_booking_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;


  List<Widget> screens = [
    const HomeScreen(),
    const GetBookingScreen(item: 0,),
    const AboutPage(),
  ];

  @override
  initState(){
    super.initState();
    
    AppBloc.get(context).getAllHotels();
  }
  @override
  Widget build(BuildContext context) {
        print(context.locale);

    return Scaffold(
      backgroundColor: Colors.transparent,
      // appBar: AppBar(
      //   title: Text(titles[currentIndex],
      //       style: const TextStyle(color: Colors.black)),
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      // ),
      
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.teal,
        items:  [
          BottomNavigationBarItem(icon: const Icon(Icons.search), label:'explore'.tr()),
          BottomNavigationBarItem(
              icon: const Icon(Icons.favorite_border), label:'trips'.tr()),
          BottomNavigationBarItem(icon: const Icon(Icons.person), label: 'profile'.tr()),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
      ),
    );
  }
}
