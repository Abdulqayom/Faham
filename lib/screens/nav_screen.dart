// import 'dart:html';

import 'package:faham/page/uprofile.dart';
import 'package:faham/screens/home1.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:faham/widgets/widgets.dart';

class NavScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> with TickerProviderStateMixin {
  final List<Widget> _screens = [
    // NavScreen1()0
    MyApp(),
    // Scaffold(),
    // apipost(),
    // Scaffold(),
    // Scaffold(),
    // Scaffold(),
    // SignInScreen(),
    uProfile(),
    // loginform(),
    // SignInScreen(),
    // MyDrawer(),
  ];
  final List<IconData> _icons = [
    Icons.home,
    Icons.menu,
  ];
  final List<IconData> _icon = [
    Icons.home,
    Icons.menu,
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: Responsive.isDesktop(context)
            ? PreferredSize(
                preferredSize: Size(screenSize.width, 60.0),
                child: CustomTabBar(
                  // currentUser: currentUser,
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                  key: null,
                ),
              )
            : null,
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: Responsive.isMobile(context)
            ? Container(
                padding: const EdgeInsets.only(bottom: 1.0),
                color: Colors.white,
                child: CustomTabBar(
                  isBottomIndicator: mounted,
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                  key: null,
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
