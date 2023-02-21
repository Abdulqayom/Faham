import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:faham/modelss/allpost/Apiallpost.dart';
import 'package:faham/page/details/details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:ui' as ui;

class apiHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return apiHomePageState();
  }
}

class apiHomePageState extends State<apiHomePage> {
  final f = new DateFormat('MMM dd');
  bool isloaded = false;
  // var img = NetworkImage("https://faham.org/images/posts/");
  // var replaceimg = AssetImage("assets/image/fahamlogo.png");

  Future<Apiallpost> getallpost() async {
    final response = await http
        .get(Uri.parse('https://www.faham.org/api/allPostsForMobile'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return Apiallpost.fromJson(data);
    } else {
      return Apiallpost.fromJson(data);
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return RefreshIndicator(
      displacement: 250,
      backgroundColor: Colors.white,
      color: Colors.red,
      strokeWidth: 3,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 4));
        setState(() {
          getallpost();
        });
      },
      child: SafeArea(
        child: FutureBuilder<Apiallpost>(
          future: getallpost(),
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
              itemCount: snapshot.data!.data!.length,
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
                                Text("Please Wait..."),
                              ],
                            ),
                          );
                        }
                      },
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => apiDetailsScreen(
                                uuid: snapshot.data!.data![position].uuid
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
                            height: 123,
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
                                                left: 10, top: 5),
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
                                                                  .data![
                                                                      position]
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
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          new Container(
                                                              child: Image.asset(
                                                                  "assets/image/user1.png"))),
                                                ),
                                                // CircleAvatar(
                                                //   backgroundImage:
                                                //    NetworkImage(
                                                //       snapshot.hasData
                                                //           ? 'https://faham.org/images/users_images/thumb/' +
                                                //               snapshot
                                                //                   .data!
                                                //                   .data[position]
                                                //                   .user!
                                                //                   .image
                                                //                   .toString()
                                                //           : Icon(Icons.image)
                                                //               .toString()),
                                                //   radius: 15,

                                                //   // ),
                                                // ),
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
                                                          ' ' +
                                                              snapshot
                                                                  .data!
                                                                  .data![
                                                                      position]
                                                                  .user!
                                                                  .firstName
                                                                  .toString() +
                                                              ' ' +
                                                              snapshot
                                                                  .data!
                                                                  .data![
                                                                      position]
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

                                                Text("In".tr),
                                                Text(" "),
                                                SizedBox(
                                                  width: 65,
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
                                              ],
                                            ),
                                          ),
                                          // SizedBox(
                                          //   height: 2,
                                          // ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 2,
                                            ),
                                            child: SizedBox(
                                              // height: 70,

                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .085,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .57,
                                              child: Text(
                                                overflow: TextOverflow.ellipsis,
                                                textDirection: snapshot
                                                            .data!
                                                            .data![position]
                                                            .languageId
                                                            .toString() ==
                                                        '1'
                                                    ? ui.TextDirection.ltr
                                                    : ui.TextDirection.rtl,
                                                textAlign: snapshot
                                                            .data!
                                                            .data![position]
                                                            .languageId
                                                            .toString() ==
                                                        '1'
                                                    ? TextAlign.left
                                                    : TextAlign.right,

                                                // textAlign: TextAlign.justify,
                                                //  textDirection:TextDirection.LTR,
                                                snapshot
                                                    .data!.data![position].title
                                                    .toString(),

                                                // textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  fontFamily: snapshot
                                                              .data!
                                                              .data![position]
                                                              .languageId
                                                              .toString() ==
                                                          '1'
                                                      ? "Arial"
                                                      : "pashto",
                                                ),

                                                // textScaleFactor: double.negativeInfinity,
                                                maxLines: 2,
                                                //  softWrap: true,
                                                // textWidthBasis: TextWidthBasis.longestLine,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 1, left: 20),
                                            child: Row(
                                              children: [
                                                Container(
                                                  child: Text(
                                                    f
                                                        .format(DateTime.parse(
                                                                snapshot
                                                                    .data!
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
                                                //   padding:
                                                //       const EdgeInsets.only(
                                                //           left: 90),
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
                                      VerticalDivider(width: 2),
                                      Container(
                                        padding:
                                            EdgeInsets.only(left: 3, right: 2),
                                        // margin: const EdgeInsets.all(2.0),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .28,
                                        // height: 140,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .11,
                                        child: CachedNetworkImage(
                                            fit: BoxFit.fill,
                                            imageUrl:
                                                'https://www.faham.org/images/posts/' +
                                                    snapshot.data!
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
                                                    // width: 150,
                                                    child: Image.asset(
                                                        fit: BoxFit.fill,
                                                        "assets/image/faham0.jpg"))),
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
                          uuid: snapshot.data!.data![position].uuid as String),
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
      ),
    );
  }
}
