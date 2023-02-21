import 'dart:async';
import 'dart:convert';
import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:faham/modelss/allpost/Apiallpost.dart';
import 'package:faham/modelss/details/Postdetails.dart';
import 'package:faham/modelss/details/Posts.dart';
import 'package:faham/modelss/userdetails/Userdetailsview.dart';
import 'package:faham/page/userprofile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart' as style;
import 'package:provider/provider.dart';

class apiDetailsScreen extends StatefulWidget {
  final String uuid;
  apiDetailsScreen({required this.uuid});

  @override
  State<apiDetailsScreen> createState() => _apiDetailsScreenState();
}

class _apiDetailsScreenState extends State<apiDetailsScreen> {
  final f = new DateFormat('yyyy-MM-dd hh:mm');
  Future<Apiallpost> getallpost() async {
    final response = await http
        .get(Uri.parse('https://www.faham.org/api/allPostsForMobile'));
    var data1 = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return Apiallpost.fromJson(data1);
    } else {
      return Apiallpost.fromJson(data1);
    }
  }

  Future<Userdetailsview> getpost() async {
    final response = await http.get(
        Uri.parse('https://www.faham.org/api/webPostDetails/' + widget.uuid));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return Userdetailsview.fromJson(data);
    } else {
      return Userdetailsview.fromJson(data);
    }
  }

  // Future<Userdetailsview> getuserpost() async {
  //   final response = await http
  //       .get(Uri.parse('https://faham.org/api/webPostDetails/' + widget.uuid));
  //   var data = jsonDecode(response.body.toString());
  //   if (response.statusCode == 200) {
  //     return Userdetailsview.fromJson(data);
  //   } else {
  //     return Userdetailsview.fromJson(data);
  //   }
  // }

  var isclicked = true;

  var clicked = true;

  int count = 1;

  var shareclick = true;

  var saveclick = false;

  int savecount = 1;

  int sharecount = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<Userdetailsview>(
        future: getpost(),
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

          return SafeArea(
            child: Scaffold(
              body: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      backgroundColor: Colors.black,
                      expandedHeight: 300.0,
                      floating: false,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        expandedTitleScale: 1.5,
                        centerTitle: true,
                        stretchModes: [
                          StretchMode.blurBackground,
                          StretchMode.fadeTitle,
                          StretchMode.zoomBackground
                        ],
                        title: GestureDetector(
                          onTap: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => apiProfile(
                                    index: snapshot.data!.post!.user!.uuid
                                        as String),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 7, left: 6),
                            child: Text(
                              textAlign: TextAlign.left,
                              snapshot.data!.post!.user!.firstName.toString() +
                                  ' ' +
                                  snapshot.data!.post!.user!.lastName
                                      .toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                          ),
                        ),
                        background: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              child: CachedNetworkImage(
                                  // width: 350,

                                  fit: BoxFit.fill,
                                  // imageBuilder: (context, imageProvider) {
                                  //   return CircleAvatar(
                                  //     // radius: ,
                                  //     child: Container(),
                                  //     backgroundImage: imageProvider,
                                  //   );
                                  // },
                                  imageUrl: 'https://faham.org/images/posts/' +
                                      snapshot.data!.post!.image.toString(),
                                  placeholder: (context, url) => Center(
                                        child: Container(
                                            child: CircularProgressIndicator()),
                                      ),
                                  errorWidget: (context, url, error) =>
                                      new Container(
                                          child: Image.asset(
                                              fit: BoxFit.fill,
                                              "assets/image/faham0.jpg"))),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.8),
                                  ],
                                  begin: Alignment.topCenter,
                                  stops: [0.6, 1],
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(top: 30, bottom: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontFamily: "Sigmar"),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                child: CachedNetworkImage(
                                                  height: 70,
                                                  width: 70,
                                                  // height: 50,
                                                  imageUrl:
                                                      'https://faham.org/images/users_images/thumb/' +
                                                          snapshot.data!.post!
                                                              .user!.image
                                                              .toString(),
                                                  // imageBuilder:
                                                  //     (context, imageProvider) {
                                                  //   return CircleAvatar(
                                                  //     radius: 99,
                                                  //     child: Container(),
                                                  //     backgroundImage:
                                                  //         imageProvider,
                                                  //   );
                                                  // },
                                                  // progressIndicatorBuilder:
                                                  //     (context, url, progress) {
                                                  //   return CircularProgressIndicator(
                                                  //     value: progress.progress,
                                                  //   );
                                                  // },

                                                  placeholder: (context, url) =>
                                                      Center(
                                                    child: Container(
                                                        child:
                                                            CircularProgressIndicator()),
                                                  ),
                                                  errorWidget:
                                                      (context, url, error) {
                                                    debugPrint(
                                                        error.toString());
                                                    // debugPrint(
                                                    //     error.toString());
                                                    return Container(
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              "assets/image/user1.png"),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              Text(
                                                f
                                                    .format(DateTime.parse(
                                                            snapshot.data!.post!
                                                                .createdAt
                                                                .toString())
                                                        as DateTime)
                                                    .toString(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ];
                },
                body: SafeArea(
                  child: Padding(
                      padding: const EdgeInsets.only(
                        top: 0,
                      ),
                      child: FutureBuilder<Userdetailsview>(
                          future: getpost(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                // heightFactor: 23,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 80,
                                    ),
                                    Container(
                                        child: CircularProgressIndicator()),
                                    Text("Please Wait..."),
                                  ],
                                ),
                              );
                            }
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              // height: 50,
                              padding: EdgeInsets.all(8),
                              child: ListView(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 10, right: 10),
                                    child: Text(
                                      textAlign: snapshot.data!.post!.languageId
                                                  .toString() ==
                                              '1'
                                          ? TextAlign.left
                                          : TextAlign.right,
                                      textDirection: snapshot
                                                  .data!.post!.languageId
                                                  .toString() ==
                                              '1'
                                          ? ui.TextDirection.ltr
                                          : ui.TextDirection.rtl,
                                      snapshot.data!.post!.title.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                        fontFamily: snapshot
                                                    .data!.post!.languageId
                                                    .toString() ==
                                                '1'
                                            ? "Arial"
                                            : "pashto",
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, top: 0, right: 5),
                                    child: GestureDetector(
                                      onHorizontalDragDown: (details) async {
                                        await Future.delayed(
                                            Duration(seconds: 5));
                                        setState(() {
                                          isclicked = false;
                                        });
                                      },

                                      child: Html(
                                        data: snapshot.data!.post!.description
                                            .toString(),
                                        style: {
                                          "body": style.Style(
                                            fontSize: FontSize(18.0),
                                            // fontWeight: FontWeight.bold,
                                            textAlign: snapshot
                                                        .data!.post!.languageId
                                                        .toString() ==
                                                    '1'
                                                ? TextAlign.left
                                                : TextAlign.right,
                                            direction: snapshot
                                                        .data!.post!.languageId
                                                        .toString() ==
                                                    '1'
                                                ? ui.TextDirection.ltr
                                                : ui.TextDirection.rtl,
                                            fontFamily: snapshot
                                                        .data!.post!.languageId
                                                        .toString() ==
                                                    '1'
                                                ? "Arial"
                                                : "pashto",
                                          ),
                                        },
                                      ),

                                      // Html(
                                      //   data: snapshot
                                      //       .data!.post!.description
                                      //       .toString(),

                                      //   // customTextAlign: (elem) => snapshot
                                      //   //             .data!.post!.languageId
                                      //   //             .toString() ==
                                      //   //         '1'
                                      //   //     ? TextAlign.left
                                      //   //     : TextAlign.right,

                                      //   // `7666666666666666666668`
                                      // ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      VerticalDivider(
                                        width: 8,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Container(
                                            child: TextButton.icon(
                                          onPressed: () {
                                            setState(() {
                                              // isclicked = !isclicked;
                                              // count++;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.remove_red_eye,
                                            // isclicked
                                            //     ? Icons.remove_red_eye
                                            //     : Icons.remove_red_eye,
                                            // color: isclicked
                                            //     ? Color.fromARGB(
                                            //         255, 25, 22, 22)
                                            //     : Color.fromARGB(
                                            //         255, 4, 35, 189),
                                            // size: 25,
                                          ),
                                          label: Text(
                                            snapshot.data!.postViews
                                                    .toString() +
                                                'Views'.tr,
                                            style: TextStyle(
                                              color: Colors.grey[800],
                                            ),
                                          ),
                                        )),
                                      ),
                                      // Padding(
                                      //   padding:
                                      //       const EdgeInsets.only(left: 10),
                                      //   child: TextButton.icon(
                                      //     onPressed: () {
                                      //       setState(() {
                                      //         saveclick = !saveclick;
                                      //       });
                                      //     },
                                      //     icon: Icon(
                                      //       saveclick
                                      //           ? Icons.bookmark_outlined
                                      //           : Icons
                                      //               .bookmark_outline_rounded,
                                      //       color: saveclick
                                      //           ? Colors.blue
                                      //           : Colors.grey[800],
                                      //     ),
                                      //     label: Text(
                                      //       'Save'.tr,
                                      //       style: TextStyle(
                                      //         fontWeight: FontWeight.bold,
                                      //         color: Colors.grey[800],
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 60),
                                        child: TextButton.icon(
                                          onPressed: () {
                                            setState(() {
                                              // Share.share("");
                                              shareclick = false;
                                              FlutterShare.share(
                                                  title: 'Faham share',
                                                  text: 'Share Faham',
                                                  linkUrl:
                                                      'https://www.faham.org/#/index',
                                                  chooserTitle: 'Faham');
                                            });
                                          },
                                          icon: Icon(
                                            Icons.share_outlined,
                                            color: shareclick
                                                ? Colors.grey[800]
                                                : Colors.blue,
                                          ),
                                          label: Text(
                                            // '${shareclick ? posts[widget.index].shares : posts[widget.index].shares + sharecount}' +
                                            'Shares'.tr,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey[800],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  VerticalDivider(
                                    thickness: 43,
                                    width: 400,
                                    color: Colors.black,
                                  ),
                                  SafeArea(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.24,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: snapshot
                                            .data!.userRecentPost!.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (ctx, index) =>
                                            GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (ctx) =>
                                                    apiDetailsScreen(
                                                        uuid: snapshot
                                                            .data!
                                                            .userRecentPost![
                                                                index]
                                                            .uuid as String),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            margin: EdgeInsets.all(5),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.36,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    'https://faham.org/images/posts/' +
                                                        snapshot
                                                            .data!
                                                            .userRecentPost![
                                                                index]
                                                            .image
                                                            .toString()),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Container(
                                              height: double.infinity,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Colors.transparent,
                                                    Colors.black
                                                        .withOpacity(0.9)
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  stops: [0.5, 1],
                                                  end: Alignment.bottomCenter,
                                                ),
                                              ),
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Spacer(),
                                                  Text(
                                                    snapshot
                                                        .data!
                                                        .userRecentPost![index]
                                                        .title
                                                        .toString(),
                                                    maxLines: 2,
                                                    overflow: TextOverflow.fade,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  // Icon(Icons.access_alarm),
                                                  Text(
                                                    f
                                                        .format(DateTime.parse(
                                                          snapshot
                                                              .data!
                                                              .userRecentPost![
                                                                  index]
                                                              .createdAt
                                                              .toString(),
                                                        ) as DateTime)
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: Colors.white
                                                          .withOpacity(0.5),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          })),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
