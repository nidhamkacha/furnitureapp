import 'package:flutter/material.dart';
import 'package:furnitureapp/res/static/app_color.dart';
import 'package:furnitureapp/view/tabbarscreen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    TabbarScreen(),
    TabbarScreen(),
    TabbarScreen(),
    TabbarScreen()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: AppColor.blackcolor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark_border_outlined,
                color: AppColor.blackcolor,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_none_outlined,
                color: AppColor.blackcolor,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline_outlined,
                color: AppColor.blackcolor,
              ),
              label: ''),
        ],
        showSelectedLabels: false, // Disable selected item label
        showUnselectedLabels: false,
        selectedItemColor: AppColor.blackcolor,
        selectedIconTheme: IconThemeData(color: Colors.black),
        onTap: _onItemTapped,
      ),
    );
  }
}
