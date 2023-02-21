import 'dart:io';

import 'package:faham/localstring.dart';
import 'package:faham/theme.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:ffi';
import 'package:http/http.dart';
import 'package:faham/themes/constanst.dart';
import 'package:faham/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:faham/screens/nav_screen.dart';
import 'package:get/get.dart';
import 'package:intl/locale.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:faham/provider/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  WidgetsFlutterBinding.ensureInitialized();
  // await Permission.camera.request();
  // await Permission.microphone.request();
  // await Permission.storage.request();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
//    dart --no-sound-null-safety run
//  flutter run --no-sound-null-safety
  // static const String title = 'Light & Dark Theme';
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);

          return GetMaterialApp(
            // title: title,
            debugShowCheckedModeBanner: false,
            translations: localstring(),
            // locale: Locale(),
            // themeMode: themeProvider.themeMode,
            // theme: MyThemes.lightTheme,
            // darkTheme: MyThemes.darkTheme,
            // theme: theme(),
            home: NavScreen(),
            // SplashScreen(),
            //  SplashScreen(),

            // initialRoute: SplashScreen.routeName,
          );
        },
      );
}
