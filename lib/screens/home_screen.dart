import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tandiza/screens/dashboard_screen.dart';
import 'package:tandiza/screens/profile_screen.dart';
import 'package:tandiza/screens/transaction_screen.dart';
import 'package:tandiza/screens/wallet_screen.dart';

import '../utilities/settings.dart';

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
    DashBoard(),
    WalletScreen(),
    TransactionScreen(),
    ProfileScreen()
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
        backgroundColor: kPrimaryColour,
        showSelectedLabels: true,
        onTap: _onItemTap,
        currentIndex: _pageIndex,
        selectedItemColor: kSecondaryColour,
        unselectedItemColor: kWhiteColour,
        unselectedLabelStyle: TextStyle(color: kSecondaryColour),
        selectedLabelStyle: TextStyle(
          color: kSecondaryColour,
        ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.star,
              color: kSecondaryColour,
            ),
            icon: Icon(
              Icons.star_border,
              color: kWhiteColour,
            ),
            label:
            'Top Rated',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.menu_book,
              color: kSecondaryColour,
            ),
            icon: Icon(
              Icons.menu_book,
              color: kWhiteColour,
            ),
            label:
            'Learn',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.cloud_download_sharp,
              color: kSecondaryColour,
            ),
            icon: Icon(
              Icons.cloud_download_outlined,
              color: kWhiteColour,
            ),
            label:
            'Downloads',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.person,
              color: kSecondaryColour,
            ),
            icon: Icon(
              Icons.person_outline,
              color: kWhiteColour,
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