import 'package:flutter/material.dart';
import 'package:ufarming/screens/articles_screen.dart';
import 'package:ufarming/screens/home_screen.dart';
import 'package:ufarming/screens/my_plants_screen.dart';
import 'package:ufarming/screens/profile/profile_screen.dart';
import 'package:ufarming/utils/my_colors.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;

  Widget buildBody(index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return MyPlantsScreen();
      case 2:
        return ArticlesScreen();
      case 3:
        return ProfileScreen();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: MyColors.primary,
        unselectedItemColor: MyColors.grey,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        currentIndex: index,
        onTap: (value) {
          index = value;
          if (mounted) setState(() {});
        },
        iconSize: 25,
        elevation: 25,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        ),
        items: [
          buildBottomNavigationBarItem(
            Icons.spa_outlined,
            Icons.spa_rounded,
            'Home',
          ),
          buildBottomNavigationBarItem(
            Icons.eco_outlined,
            Icons.eco_rounded,
            'My Plant',
          ),
          buildBottomNavigationBarItem(
            Icons.article_outlined,
            Icons.article_rounded,
            'Learn',
          ),
          buildBottomNavigationBarItem(
            Icons.person_outline,
            Icons.person_rounded,
            'Profile',
          ),
        ],
      ),
      body: buildBody(index),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      IconData icon, IconData activeIcon, String label) {
    return BottomNavigationBarItem(
      label: label,
      activeIcon: Icon(activeIcon),
      icon: Icon(icon),
    );
  }
}
