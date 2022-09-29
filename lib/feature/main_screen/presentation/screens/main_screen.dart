import 'package:booking/core/util/blocs/app/cubit.dart';
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
  List<String> titles = ['', 'Trips', 'Profile'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(titles[currentIndex],
      //       style: const TextStyle(color: Colors.black)),
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      // ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.teal,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'Trips'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
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
