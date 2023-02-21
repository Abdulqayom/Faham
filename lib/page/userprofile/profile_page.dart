import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:faham/modelss/userdetails/Userdetailsview.dart';
import 'package:faham/modelss/userprofile/Userprofile.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:faham/modelss/allpost/Apiallpost.dart';

import 'package:faham/page/details/details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:ui' as ui;

class apiuserHomePage extends StatefulWidget {
  final String index;
  apiuserHomePage({required this.index});
  @override
  State<StatefulWidget> createState() {
    return apiuserHomePageState();
  }
}

class apiuserHomePageState extends State<apiuserHomePage> {
  final f = new DateFormat('MMM dd');

  Future<Userprofile> getuserpost() async {
    final response = await http.get(Uri.parse(
        'https://www.faham.org/api/webUserPostsMobile/' + widget.index));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return Userprofile.fromJson(data);
    } else {
      return Userprofile.fromJson(data);
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return SafeArea(
      child: FutureBuilder<Userprofile>(
        future: getuserpost(),
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
                  Text("Please Wait..."),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.userPosts!.data!.length,
            itemBuilder: (context, position) => GestureDetector(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => apiDetailsScreen(
                              uuid: snapshot.data!.userPosts!.data![position]
                                  .uuid as String),
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
                            children: <Widget>[
                              Container(
                                // padding: const EdgeInsets.only(right: 15),
                                child: Row(
                                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 6),
                                          child: Row(
                                            // crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: CachedNetworkImage(
                                                    height: 30,
                                                    width: 30,
                                                    // height: 50,
                                                    imageUrl:
                                                        'https://faham.org/images/users_images/thumb/' +
                                                            snapshot
                                                                .data!
                                                                .userPosts!
                                                                .data![position]
                                                                .user!
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
                                              SizedBox(
                                                width: 100,
                                                child: Row(
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        // style:TextStyle()
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        snapshot
                                                                .data!
                                                                .userPosts!
                                                                .data![position]
                                                                .user!
                                                                .firstName
                                                                .toString() +
                                                            ' ' +
                                                            snapshot
                                                                .data!
                                                                .userPosts!
                                                                .data![position]
                                                                .user!
                                                                .lastName
                                                                .toString(),
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              Text("in ".tr),
                                              SizedBox(
                                                width: 60,
                                                child: Row(
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        snapshot
                                                            .data!
                                                            .userPosts!
                                                            .data![position]
                                                            .postCategory!
                                                            .name
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // Padding(
                                              //   padding: const EdgeInsets.only(
                                              //       left: 5),
                                              //   child: Text(
                                              //     textAlign: TextAlign.left,
                                              //     snapshot
                                              //             .data!
                                              //             .userPosts!
                                              //             .data![position]
                                              //             .user!
                                              //             .firstName
                                              //             .toString() +
                                              //         ' ' +
                                              //         snapshot
                                              //             .data!
                                              //             .userPosts!
                                              //             .data![position]
                                              //             .user!
                                              //             .lastName
                                              //             .toString(),
                                              //     style: TextStyle(
                                              //       fontWeight: FontWeight.w400,
                                              //     ),
                                              //   ),
                                              // ),
                                              // Text(" in ".tr),
                                              // Text(
                                              //   snapshot
                                              //       .data!
                                              //       .userPosts!
                                              //       .data![position]
                                              //       .postCategory!
                                              //       .name
                                              //       .toString(),
                                              //   style: TextStyle(
                                              //     fontWeight: FontWeight.w600,
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 2,
                                            // top: 4,
                                          ),
                                          child: SizedBox(
                                            // height: 70,

                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .59,
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              textDirection: snapshot
                                                          .data!
                                                          .userPosts!
                                                          .data![position]
                                                          .languageId
                                                          .toString() ==
                                                      '1'
                                                  ? ui.TextDirection.ltr
                                                  : ui.TextDirection.rtl,
                                              textAlign: snapshot
                                                          .data!
                                                          .userPosts!
                                                          .data![position]
                                                          .languageId
                                                          .toString() ==
                                                      '1'
                                                  ? TextAlign.left
                                                  : TextAlign.right,
                                              // textAlign: TextAlign.justify,
                                              //  textDirection:TextDirection.LTR,
                                              snapshot.data!.userPosts!
                                                  .data![position].title
                                                  .toString(),
                                              // textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),

                                              // textScaleFactor: double.negativeInfinity,
                                              maxLines: 2,
                                              //  softWrap: true,
                                              // textWidthBasis: TextWidthBasis.longestLine,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5, left: 20),
                                          child: Row(
                                            children: [
                                              Container(
                                                child: Text(
                                                  f
                                                      .format(DateTime.parse(
                                                              snapshot
                                                                  .data!
                                                                  .userPosts!
                                                                  .data![position]
                                                                  .createdAt
                                                                  .toString())
                                                          as DateTime)
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                              // Padding(
                                              //   padding: const EdgeInsets.only(
                                              //       left: 130),
                                              //   child: Icon(Icons
                                              //       .bookmark_add_outlined),
                                              // )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 1,
                                        ),
                                      ],
                                    ),
                                    VerticalDivider(width: 1),
                                    SafeArea(
                                      child: Container(
                                        padding:
                                            EdgeInsets.only(left: 2, right: 5),
                                        // margin: const EdgeInsets.all(2.0),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .30,
                                        // height: 140,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .12,
                                        child: CachedNetworkImage(
                                            fit: BoxFit.fill,
                                            imageUrl:
                                                'https://faham.org/images/posts/' +
                                                    snapshot.data!.userPosts!
                                                        .data![position].image
                                                        .toString(),
                                            placeholder: (context, url) =>
                                                Center(
                                                  child: Container(
                                                      child:
                                                          CircularProgressIndicator()),
                                                ),
                                            errorWidget: (context, url,
                                                    error) =>
                                                new Container(
                                                    child: Image.asset(
                                                        fit: BoxFit.fill,
                                                        "assets/image/faham0.jpg"))),
                                      ),
                                      //  Container(
                                      //   padding:
                                      //       EdgeInsets.only(left: 5, right: 2),
                                      //   // margin: const EdgeInsets.all(2.0),
                                      //   width:
                                      //       MediaQuery.of(context).size.width *
                                      //           .30,
                                      //   // height: 140,
                                      //   height:
                                      //       MediaQuery.of(context).size.height *
                                      //           .14,
                                      //   decoration: BoxDecoration(
                                      //     borderRadius:
                                      //         BorderRadius.circular(8.0),
                                      //     boxShadow: [
                                      //       BoxShadow(
                                      //         color: Colors.black54,
                                      //         // offset: Offset(0, 5),
                                      //         blurRadius: 8.0,
                                      //       ),
                                      //     ],
                                      //     image: DecorationImage(
                                      //         fit: BoxFit.cover,
                                      //         image: NetworkImage(snapshot
                                      //                 .hasData
                                      //             ? 'https://faham.org/images/posts/' +
                                      //                 snapshot.data!.userPosts!
                                      //                     .data![position].image
                                      //                     .toString()
                                      //             : Icon(Icons.image)
                                      //                 .toString())
                                      //         // 'https://faham.org/images/posts/' +
                                      //         //     snapshot.data!
                                      //         //         .data[position].image!
                                      //         //         .toString()),
                                      //         ),
                                      //     //   AssetImage(
                                      //     //       snapshot.data!.data[position].image.toString()),
                                      //     //   fit: BoxFit.cover,
                                      //     // ),
                                      //   ),
                                      // ),
                                    ),
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => apiDetailsScreen(
                        uuid: snapshot.data!.userPosts!.data![position].uuid
                            as String),
                  ),
                );

                // VerticalDivider(
                //   thickness: 73,

                //   width: 400,
                //   color: Colors.black,
                // );
              },
            ),
          );
        },
      ),
    );
  }
}
