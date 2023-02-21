import 'package:faham/fahamweb.dart';
import 'package:faham/feedback_screen.dart';
import 'package:faham/help_screen.dart';
import 'package:faham/invite_friend_screen.dart';
import 'package:faham/page/allusers/apiallusers.dart';
import 'package:faham/screens/about_us.dart';
import 'package:faham/screens/nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
// import '../provider/homepage.dart';

class uProfile extends StatefulWidget {
  @override
  State<uProfile> createState() => _uProfileState();
}

class _uProfileState extends State<uProfile> {
  // List<DrawerList>? drawerList;
  bool isdrawer = false;
  bool isclick = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Color.fromRGBO(7, 41, 77, 1),
          //   title: Text("Menu"),
          // ),
          body: Drawer(
            width: 410,
            backgroundColor: isclick ? Colors.black : Colors.white,
            child: ListView(
              padding: EdgeInsets.only(
                top: 24 + MediaQuery.of(context).padding.top,
                bottom: 24,
              ),
              children: [
                // ListTile(
                //   trailing: Icon(isdrawer ? Icons.favorite : null,
                //       color: isclick ? Colors.white : Colors.black),
                //   leading: Icon(isdrawer ? null : Icons.favorite,
                //       color: isclick ? Colors.white : Colors.black),
                //   // leading: Icon(Icons.favorite,
                //   //     color: isclick ? Colors.white : Colors.black),
                //   title: Text(
                //     'Favorites'.tr,
                //     textAlign: isdrawer ? TextAlign.right : TextAlign.left,
                //     style: TextStyle(
                //         color: isclick ? Colors.white : Colors.black,
                //         fontSize: 15,
                //         fontWeight: FontWeight.bold),
                //   ),
                //   onTap: () => null,
                // ),
                ListTile(
                  // subtitle: Text("silab"),
                  trailing: Icon(isdrawer ? Icons.home : null,
                      color: isclick ? Colors.white : Colors.black),
                  leading: Icon(isdrawer ? null : Icons.home,
                      color: isclick ? Colors.white : Colors.black),
                  // leading: Icon(Icons.home,
                  //     color: isclick ? Colors.white : Colors.black),
                  title: Text(
                    'Home'.tr,
                    textAlign: isdrawer ? TextAlign.right : TextAlign.left,
                    style: TextStyle(
                        color: isclick ? Colors.white : Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => NavScreen()));
                    });
                  },
                  // onLongPress:
                ),
                // Divider(),
                ListTile(
                  trailing: Icon(isdrawer ? Icons.people : null,
                      color: isclick ? Colors.white : Colors.black),
                  leading: Icon(isdrawer ? null : Icons.people,
                      color: isclick ? Colors.white : Colors.black),
                  // leading: Icon(Icons.people,
                  //     color: isclick ? Colors.white : Colors.black),
                  title: Text(
                    'Members'.tr,
                    textAlign: isdrawer ? TextAlign.right : TextAlign.left,
                    style: TextStyle(
                        color: isclick ? Colors.white : Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => apiallusersPage()));
                    });
                  },
                ),
                ListTile(
                  trailing: Icon(isdrawer ? Icons.person_add_sharp : null,
                      color: isclick ? Colors.white : Colors.black),
                  leading: Icon(isdrawer ? null : Icons.person_add_sharp,
                      color: isclick ? Colors.white : Colors.black),
                  // leading: Icon(Icons.people,
                  //     color: isclick ? Colors.white : Colors.black),
                  title: Text(
                    'Become Our Members'.tr,
                    textAlign: isdrawer ? TextAlign.right : TextAlign.left,
                    style: TextStyle(
                        color: isclick ? Colors.white : Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => fahamweb()));
                    });
                  },
                ),
                // ListTile(
                //   trailing: Icon(isdrawer ? Icons.post_add_sharp : null,
                //       color: isclick ? Colors.white : Colors.black),
                //   leading: Icon(isdrawer ? null : Icons.post_add_sharp,
                //       color: isclick ? Colors.white : Colors.black),
                //   title: Text(
                //     'Create New Post'.tr,
                //     textAlign: isdrawer ? TextAlign.right : TextAlign.left,
                //     style: TextStyle(
                //         color: isclick ? Colors.white : Colors.black,
                //         fontSize: 15,
                //         fontWeight: FontWeight.bold),
                //   ),
                //   onTap: () {
                //     setState(() {
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (_) => newpost()));
                //     });
                //   },
                // ),
                ListTile(
                  trailing: Icon(isdrawer ? Icons.groups_outlined : null,
                      color: isclick ? Colors.white : Colors.black),
                  leading: Icon(isdrawer ? null : Icons.groups_outlined,
                      color: isclick ? Colors.white : Colors.black),
                  title: Text(
                    'Invite Friends'.tr,
                    textAlign: isdrawer ? TextAlign.right : TextAlign.left,
                    style: TextStyle(
                        color: isclick ? Colors.white : Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => InviteFriend()));
                    });
                  },
                ),

                Theme(
                  data: Theme.of(context).copyWith(
                      unselectedWidgetColor:
                          isclick ? Colors.white : Colors.black,
                      colorScheme: isclick
                          ? ColorScheme.light(primary: Colors.white)
                          : ColorScheme.light(primary: Colors.black),
                      dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    // collapsedIconColor: isclick ? Colors.white : Colors.black,
                    // iconColor: isclick ? Colors.white : Colors.black,
                    // collapsedBackgroundColor: isclick ? Colors.white : Colors.black,
                    // trailing: Icon(isclick ? Colors.white: Colors),
                    //  Icon(
                    //     isclick ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up),

                    // leading:  isdrawer ? (Icons.language,
                    //     color: isclick ? Colors.white : Colors.black):null,
                    leading: isdrawer
                        ? null
                        : Icon(Icons.language,
                            color: isclick ? Colors.white : Colors.black),
                    title: Text("Language".tr,
                        textAlign: isdrawer ? TextAlign.right : TextAlign.left,
                        style: TextStyle(
                            color: isclick ? Colors.white : Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    children: [
                      ListTile(
                        title: Text("English".tr,
                            textAlign:
                                isdrawer ? TextAlign.right : TextAlign.left,
                            style: TextStyle(
                                color: isclick ? Colors.white : Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        onTap: () {
                          setState(() {
                            isdrawer = false;
                            var locale = Locale('en', 'US');
                            Get.updateLocale(locale);
                          });
                        },
                      ),
                      ListTile(
                        title: Text("Pashto".tr,
                            textAlign:
                                isdrawer ? TextAlign.right : TextAlign.left,
                            style: TextStyle(
                                color: isclick ? Colors.white : Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        onTap: () {
                          setState(() {
                            isdrawer = true;
                            var locale = Locale('pa', 'AF');
                            Get.updateLocale(locale);
                          });
                        },
                      ),
                      ListTile(
                        title: Text("Dari".tr,
                            textAlign:
                                isdrawer ? TextAlign.right : TextAlign.left,
                            style: TextStyle(
                                color: isclick ? Colors.white : Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        onTap: () {
                          setState(() {
                            isdrawer = true;

                            var locale = Locale('dr', 'AF');
                            Get.updateLocale(locale);
                          });
                        },
                      )
                    ],
                  ),
                ),

                ListTile(
                    trailing: Icon(
                        isdrawer
                            ? isclick
                                ? Icons.wb_sunny
                                : Icons.nights_stay
                            : null,
                        color: isclick ? Colors.white : Colors.black),
                    leading: Icon(
                        isdrawer
                            ? null
                            : isclick
                                ? Icons.wb_sunny
                                : Icons.nights_stay,
                        color: isclick ? Colors.white : Colors.black),
                    title: Text(
                      isclick ? 'Light Mood'.tr : 'Dark Mood'.tr,
                      textAlign: isdrawer ? TextAlign.right : TextAlign.left,
                      style: TextStyle(
                          color: isclick ? Colors.white : Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      setState(() {
                        isclick = !isclick;
                      });
                    }),
                ListTile(
                  trailing: Icon(isdrawer ? Icons.help : null,
                      color: isclick ? Colors.white : Colors.black),
                  leading: Icon(isdrawer ? null : Icons.privacy_tip,
                      color: isclick ? Colors.white : Colors.black),
                  title: Text(
                    'Privacy'.tr,
                    textAlign: isdrawer ? TextAlign.right : TextAlign.left,
                    style: TextStyle(
                        color: isclick ? Colors.white : Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => privacy()));
                    });
                  },
                ),
                ListTile(
                  trailing: Icon(isdrawer ? Icons.question_mark : null,
                      color: isclick ? Colors.white : Colors.black),
                  leading: Icon(isdrawer ? null : Icons.policy,
                      color: isclick ? Colors.white : Colors.black),
                  title: Text(
                    'Policy'.tr,
                    textAlign: isdrawer ? TextAlign.right : TextAlign.left,
                    style: TextStyle(
                        color: isclick ? Colors.white : Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => policy()));
                    });
                  },
                ),
                ListTile(
                    trailing: Icon(isdrawer ? Icons.info : null,
                        color: isclick ? Colors.white : Colors.black),
                    leading: Icon(isdrawer ? null : Icons.info,
                        color: isclick ? Colors.white : Colors.black),
                    title: Text(
                      'About Us'.tr,
                      textAlign: isdrawer ? TextAlign.right : TextAlign.left,
                      style: TextStyle(
                          color: isclick ? Colors.white : Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => AboutUs()));
                      });
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
