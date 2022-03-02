import 'package:flutter/material.dart';

import '../modem/modem_screen.dart';
import '../profile/profile_screen.dart';
import '../recharge/recharge_screen.dart';
import '../usage/usage_screen.dart';

import '/utilities/constantces.dart';
import '/widgets/custom_app_bar.dart';

class ToggleBarScreens extends StatefulWidget {
  const ToggleBarScreens({Key? key}) : super(key: key);

  @override
  _ToggleBarScreensState createState() => _ToggleBarScreensState();
}

class _ToggleBarScreensState extends State<ToggleBarScreens> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  late List<Map<String, dynamic>> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
      {
        'page': const UsageScreen(),
        'title': "Usage",
      },
      {
        'page': const RechargeScreen(),
        'title': "Recharge",
      },
      {
        'page': const ModemScreen(),
        'title': "Modem",
      },
      {
        'page': const ProfileScreen(),
        'title': "Profile",
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: customAppBar(context),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.color.white,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        selectedItemColor: AppColors.color.red,
        unselectedItemColor: AppColors.color.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/usage.png",
              width: 24,
              height: 24,
              color: _selectedPageIndex == 0
                  ? AppColors.color.red
                  : AppColors.color.grey,
            ),
            label: _pages[0]['title'],
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/recharge.png",
              width: 24,
              height: 24,
              color: _selectedPageIndex == 1
                  ? AppColors.color.red
                  : AppColors.color.grey,
            ),
            label: _pages[1]['title'],
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/modern.png",
              width: 24,
              height: 24,
              color: _selectedPageIndex == 2
                  ? AppColors.color.red
                  : AppColors.color.grey,
            ),
            label: _pages[2]['title'],
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/profile.png",
              width: 24,
              height: 24,
              color: _selectedPageIndex == 3
                  ? AppColors.color.red
                  : AppColors.color.grey,
            ),
            label: _pages[3]['title'],
          ),
        ],
      ),
    );
  }
}
