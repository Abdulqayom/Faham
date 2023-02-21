import 'package:faham/page/allpost/APIhomepage.dart';
import 'package:faham/page/allusers/apiallusers.dart';
import 'package:faham/page/userprofile/profile.dart';
import 'package:faham/page/userprofile/profile_page.dart';
import 'package:faham/provider/theme_provider.dart';
import 'package:faham/screens/nav_screen.dart';

import 'package:faham/themes/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MyDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // toolbarHeight: 40,
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       showSearch(
        //         context: context,
        //         delegate: searchbox(),
        //       );
        //     },
        //     icon: Icon(Icons.search),
        //   ),
        // ],

        toolbarHeight: 100,
        // title: Text('TABS TITLE TEXT'),
        // brightness: Brightness.dark,
        backgroundColor: Color.fromRGBO(7, 41, 77, 1),
        // backgroundColor: Colors.white,
        // centerTitle: true,
        // scrolledUnderElevation: true,
        title: Text(
          'Home'.tr,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28.0,
            fontFamily: "Arial",
            fontWeight: FontWeight.bold,
            letterSpacing: -1.2,
          ),
        ),
        // floating: true,
      ),
      body: apiHomePage(),
    );
  }
}
