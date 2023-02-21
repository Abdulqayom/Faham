import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:faham/modelss/allpost/Apiallpost.dart';
import 'package:faham/modelss/details/Postdetails.dart';
import 'package:faham/modelss/details/Users.dart';
import 'package:faham/modelss/userdetails/Userdetailsview.dart';
import 'package:faham/page/userprofile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:faham/Utilities/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
// import 'homepage.dart';

class apiProfile extends StatefulWidget {
  final String index;
  apiProfile({required this.index});

  @override
  State<apiProfile> createState() => _apiProfileState();
}

class _apiProfileState extends State<apiProfile> {
  // Future<Postdetails> getuserprofile() async {
  //   final response = await http
  //       .get(Uri.parse('https://faham.org/api/webUserPosts/' + widget.index));
  //   var data = jsonDecode(response.body.toString());
  //   if (response.statusCode == 200) {
  //     return Postdetails.fromJson(data);
  //   } else {
  //     return Postdetails.fromJson(data);
  //   }
  // }
  var data;
  Future<void> getuserprofile() async {
    final response = await http.get(Uri.parse(
        'https://www.faham.org/api/webUserPostsMobile/' + widget.index));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }
  //   Future<Apiallpost> getuserprofile() async {
  //   final response =
  //       await http.get(Uri.parse('https://faham.org/api/allPosts'));
  //   var data = jsonDecode(response.body.toString());
  //   if (response.statusCode == 200) {
  //     return Apiallpost.fromJson(data);
  //   } else {
  //     return Apiallpost.fromJson(data);
  //   }
  // }

  // Future<Postdetails> getuserprofile() async {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<void>(
        future: getuserprofile(),
        builder: (context, snapshot) {
          // if (snapshot.hasData) {
          //   Future.delayed(const Duration(seconds: 5), () {});
          // }
          // }
          // return Center(
          //   // heightFactor: 23,
          //   child: Column(
          //     children: [
          //       SizedBox(
          //         height: 80,
          //       ),
          //       Container(child: CircularProgressIndicator()),
          //       Text("Please Wait..."),
          //     ],
          //   ),
          // );
          // });

          return DefaultTabController(
            length: 1,
            child: Scaffold(
              body: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 56),
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: CachedNetworkImage(
                              height: 150,
                              width: 150,
                              // height: 50,
                              imageUrl:
                                  'https://faham.org/images/users_images/' +
                                      data['user']['image'].toString(),
                              placeholder: (context, url) => Center(
                                    child: Container(
                                        child: CircularProgressIndicator()),
                                  ),
                              errorWidget: (context, url, error) =>
                                  new Container(
                                      child: Image.asset(
                                          "assets/image/user1.png"))),
                        ),
                        // Container(
                        //   width: 150,
                        //   height: 150,
                        //   child: CircleAvatar(
                        //     backgroundImage: NetworkImage(
                        //         'https://faham.org/images/users_images/' +
                        //             data['user']['image']
                        //                 .toString()
                        //                 .toString()),
                        //     radius: 15,

                        //     // ),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20.0, top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Name: ' +
                                          data['user']['first_name']
                                              .toString() +
                                          ' ' +
                                          data['user']['last_name'] +
                                          '\n' +
                                          "\n   Job: " +
                                          data['user']['job'].toString(),
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        TabBar(
                          // isScrollable: true,
                          padding: EdgeInsets.only(bottom: 1),
                          labelColor: Colors.black54,
                          tabs: [
                            // VerticalDivider(
                            //   width: 50,
                            // ),
                            Tab(
                              // text: "Profile",
                              child: Text(
                                "Profile",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 1),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * .47,
                          child: TabBarView(
                            children: [
                              // HomePage(),

                              // apipost(),
                              apiuserHomePage(index: widget.index),
                              // MediumClone(),
                              // Home(),
                              // DetailsScreen(index: current),
                              // WorldSection(),
                              // Scaffold(),
                              // // LocalTypeAheadPage(),/
                              // // Scaffold(),
                              // FilterLocalListPage(),
                              // // MyApp1(),
                              // Scaffold(),
                              // Scaffold(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
