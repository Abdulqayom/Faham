import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:faham/modelss/allusers/Allusers.dart';
import 'package:faham/page/userprofile/profile.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:faham/page/details/details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:ui' as ui;

class apiallusersPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return apiallusersPageState();
  }
}

class apiallusersPageState extends State<apiallusersPage> {
  final f = new DateFormat('MMM dd');

  Future<Allusers> getallusers() async {
    final response =
        await http.get(Uri.parse('https://www.faham.org/api/webUsersMobile'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return Allusers.fromJson(data);
    } else {
      return Allusers.fromJson(data);
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return SafeArea(
      child: FutureBuilder<Allusers>(
        future: getallusers(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              // heightFactor: 23,
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Container(child: CircularProgressIndicator()),
                  // Text("Please Wait..."),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.users!.data!.length,
            itemBuilder: (context, position) => GestureDetector(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onHorizontalDragEnd: (details) {
                      if (!snapshot.hasData) {
                        Center(
                          // heightFactor: 23,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 80,
                              ),
                              Container(child: CircularProgressIndicator()),
                              // Text("Please Wait..."),
                            ],
                          ),
                        );
                      }
                    },
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (ctx) => apiuProfile(
                      //         index: snapshot.data!.users!.data![position].uuid
                      //             as String),
                      //   ),
                      // );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => apiProfile(
                              index: snapshot.data!.users!.data![position].uuid
                                  as String),
                        ),
                      );
                    },
                    child: SafeArea(
                      child: Card(
                        // clipBehavior: Clip.none,
                        margin: const EdgeInsets.only(
                            bottom: 1.5, top: 0, right: 0),
                        child: Container(
                          // padding: const EdgeInsets.only(left: 0),
                          color: Colors.white,
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // SafeArea(
                              //   child: Container(
                              //     padding: EdgeInsets.only(
                              //         left: 20, right: 2, top: 6),
                              //     margin: EdgeInsets.only(top: 9),
                              //     width:
                              //         MediaQuery.of(context).size.width * .30,
                              //     // height: 140,
                              //     height:
                              //         MediaQuery.of(context).size.height * .14,
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(8.0),
                              //       boxShadow: [
                              //         BoxShadow(
                              //           color: Colors.black54,
                              //           // offset: Offset(0, 5),
                              //           blurRadius: 8.0,
                              //         ),
                              //       ],
                              //       image: DecorationImage(
                              //           fit: BoxFit.cover,
                              //           image: NetworkImage(snapshot.hasData
                              //               ? 'https://faham.org/images/users_images/thumb/' +
                              //                   snapshot.data!.users!
                              //                       .data![position].image
                              //                       .toString()
                              //               : Icon(Icons.image).toString())
                              //           // 'https://faham.org/images/posts/' +
                              //           //     snapshot.data!
                              //           //         .data[position].image!
                              //           //         .toString()),
                              //           ),
                              //       //   AssetImage(
                              //       //       snapshot.data!.data[position].image.toString()),
                              //       //   fit: BoxFit.cover,
                              //       // ),
                              //     ),
                              //   ),
                              // ),
                              Container(
                                // padding: const EdgeInsets.only(right: 15),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 6),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // CircleAvatar(
                                              //   backgroundImage: NetworkImage(
                                              //       snapshot.hasData
                                              //           ? 'https://faham.org/images/users_images/thumb/' +
                                              //               snapshot
                                              //                   .data!
                                              //                   .users!
                                              //                   .data![position]
                                              //                   .image
                                              //                   .toString()
                                              //           : Icon(Icons.image)
                                              //               .toString()),
                                              //   radius: 45,

                                              //   // ),
                                              // ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                child: CachedNetworkImage(
                                                    height: 65,
                                                    width: 65,
                                                    // height: 50,
                                                    imageUrl:
                                                        'https://faham.org/images/users_images/thumb/' +
                                                            snapshot
                                                                .data!
                                                                .users!
                                                                .data![position]
                                                                .image
                                                                .toString(),
                                                    placeholder:
                                                        (context, url) =>
                                                            Center(
                                                              child: Container(
                                                                  child:
                                                                      CircularProgressIndicator()),
                                                            ),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        new Container(
                                                            child: Image.asset(
                                                                "assets/image/user1.png"))),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                textDirection:
                                                    ui.TextDirection.ltr,
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      textAlign: TextAlign.left,
                                                      'Name: ' +
                                                          snapshot
                                                              .data!
                                                              .users!
                                                              .data![position]
                                                              .firstName
                                                              .toString() +
                                                          ' ' +
                                                          snapshot
                                                              .data!
                                                              .users!
                                                              .data![position]
                                                              .lastName
                                                              .toString() +
                                                          "\n    Job: " +
                                                          snapshot
                                                              .data!
                                                              .users!
                                                              .data![position]
                                                              .job
                                                              .toString(),
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                                    ),
                                                  ),
                                                  // Text(
                                                  //   textDirection:
                                                  //       ui.TextDirection.ltr,
                                                  //   overflow: null,
                                                  //   textAlign: TextAlign.left,

                                                  //   // textAlign: TextAlign.justify,
                                                  //   //  textDirection:TextDirection.LTR,
                                                  //   "Job: " +
                                                  //       snapshot.data!.users!
                                                  //           .data![position].job
                                                  //           .toString(),
                                                  //   // textAlign: TextAlign.left,
                                                  //   style: TextStyle(
                                                  //       color: Colors.black,
                                                  //       fontWeight:
                                                  //           FontWeight.bold,
                                                  //       fontSize: 16),

                                                  //   // textScaleFactor: double.negativeInfinity,
                                                  //   maxLines: 2,
                                                  //   //  softWrap: true,
                                                  //   // textWidthBasis: TextWidthBasis.longestLine,
                                                  // ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    VerticalDivider(width: 1),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // onTap: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (ctx) => apiDetailsScreen(
              //           uuid: snapshot.data!.users!.data![position].uuid
              //               as String),
              //     ),
              //   );

              // VerticalDivider(
              //   thickness: 73,

              //   width: 400,
              //   color: Colors.black,
              // );
              // },
            ),
          );
        },
      ),
    );
  }
}
