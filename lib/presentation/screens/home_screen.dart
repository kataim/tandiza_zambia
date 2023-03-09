import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tandiza/presentation/screens/dashboard_screen.dart';
import 'package:tandiza/presentation/screens/profile_screen.dart';
import 'package:tandiza/presentation/screens/wallet_screen.dart';

import '../../utilities/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;

  void _onItemTap(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  final List<Widget> _children = [
    const DashBoard(),
    const LearnScreen(),
    const ProfileScreen()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        onTap: _onItemTap,
        currentIndex: _pageIndex,
        selectedItemColor: kSecondaryColour,
        unselectedItemColor: kPrimaryColour,
        unselectedLabelStyle: const TextStyle(color: kSecondaryColour),
        selectedLabelStyle: const TextStyle(
          color: kSecondaryColour,
        ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.dashboard,
              color: kSecondaryColour,
            ),
            icon: Icon(
              Icons.dashboard_outlined,
              color: kPrimaryColour,
            ),
            label:
            'Dashboard',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.insert_chart,
              color: kSecondaryColour,
            ),
            icon: Icon(
              Icons.insert_chart_outlined,
              color: kPrimaryColour,
            ),
            label:
            'Ndalama',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.person,
              color: kSecondaryColour,
            ),
            icon: Icon(
              Icons.person_outline,
              color: kPrimaryColour,
            ),
            label:
            'Account',
          ),
        ],
      ),
      body: _children[_pageIndex],
    );
  }
}