// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_node_store/app_router.dart';
import 'package:flutter_node_store/screens/bottomnavpage/home_screen.dart';
import 'package:flutter_node_store/screens/bottomnavpage/notification_screen.dart';
import 'package:flutter_node_store/screens/bottomnavpage/profile_screen.dart';
import 'package:flutter_node_store/screens/bottomnavpage/report_screen.dart';
import 'package:flutter_node_store/screens/bottomnavpage/setting_screen.dart';
import 'package:flutter_node_store/themes/colors.dart';
import 'package:flutter_node_store/utils/utility.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // สร้างตัวแปรเก็บ title ของแต่ละหน้า
  String _title = 'Flutter Store';

  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeScreen(),
    ReportScreen(),
    NotificationScreen(),
    SettingScreen(),
    ProfileScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          _title = 'Home';
          break;
        case 1:
          _title = 'Report';
          break;
        case 2:
          _title = 'Notification';
          break;
        case 3:
          _title = 'Setting';
          break;
        case 4:
          _title = 'Profile';
          break;
        default:
          _title = 'Flutter Store';
      }
    });
  }

  // logout function
  _logout() {
    // Remove token, loginStatus shared preference
    Utility.removeSharedPreference('token');
    Utility.removeSharedPreference('loginStatus');

    // Clear all route and push to login screen
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRouter.login,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      drawer: Drawer(
        // backgroundColor: primary,
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text('Veeravich Ruengkunsurat '),
                  accountEmail: Text('pete04855@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/noavartar.png'),
                  ),
                  otherAccountsPictures: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/noavartar.png'),
                    ),
                  ],
                ),
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text('Info'),
                  onTap: () {
                    Navigator.pushNamed(context, AppRouter.info);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('About'),
                  onTap: () {
                    Navigator.pushNamed(context, AppRouter.about);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.email_outlined),
                  title: Text('Contact'),
                  onTap: () {
                    Navigator.pushNamed(context, AppRouter.contact);
                  },
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Logout'),
                    onTap: () {
                      _logout();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          onTabTapped(value);
        },
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryDark,
        unselectedItemColor: secondaryText,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
