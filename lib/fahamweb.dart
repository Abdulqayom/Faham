import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// import 'package:flutter_webview_pro/webview_flutter.dart';
// import 'package:flutter_webview_pro/src/webview.dart' as webf;
// import 'package:flutter_webview_pro/src/webview.dart' as web;
import 'package:webview_flutter_platform_interface/src/types/javascript_mode.dart'
    as js;

//
class fahamweb extends StatefulWidget {
  late FlutterWebviewPlugin webview;
  @override
  State<fahamweb> createState() => _fahamwebState();
}

class _fahamwebState extends State<fahamweb> {
  TextEditingController controller = TextEditingController();
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  final Set<JavascriptChannel> jsChannels = [
    JavascriptChannel(
        name: 'Print',
        onMessageReceived: (JavascriptMessage message) {
          print(message.message);
        }),
  ].toSet();
  // late InAppWebViewController webview;
  double progress = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
        title: Text("Faham"),
        actions: [
          IconButton(
              onPressed: () async {
                if (await FlutterWebviewPlugin().canGoBack())
                  FlutterWebviewPlugin().goBack();
              },
              icon: Icon(Icons.arrow_back)),
          IconButton(
              onPressed: () async {
                // if(await controller.canGoBack())
                FlutterWebviewPlugin().reload();
              },
              icon: Icon(Icons.refresh)),
        ],
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            color: Colors.red,
            backgroundColor: Colors.black,
            value: progress,
          ),
          Expanded(
            child: WebviewScaffold(
              url: "https://www.faham.org/#/login",
              javascriptChannels: jsChannels,
              withZoom: true,
              withLocalStorage: true,

              // persistentFooterButtons: [

              // ],
              // hidden: true,
              // initialChild: Container(
              //   color: Colors.redAccent,
              //   child: const Center(
              //     child: CircularProgressIndicator(),
              //   ),
              // ),
              //         appBar: AppBar(
              //   backgroundColor: Colors.green,
              //   leading: Icon(Icons.search),
              //   title: TextField(
              //     controller: controller,
              //     textInputAction: TextInputAction.search,
              //     onSubmitted:(url)=>searchURL(),
              //     style: TextStyle(
              //       color: Colors.white
              //     ),
              //     decoration: InputDecoration(
              //       hintText: "Search Here",
              //       hintStyle: TextStyle(color: Colors.white)
              //     ),
              //   ),
              //  actions: [
              //     IconButton(icon: Icon(Icons.arrow_back),
              //     onPressed: (){
              //       FlutterWebviewPlugin().goBack();
              //       // controller.text="";
              //     }
              //     ),
              //     IconButton(icon: Icon(Icons.arrow_forward),
              //     onPressed:  (){
              //       FlutterWebviewPlugin().goForward();
              //       // controller.text="";
              //     }
              //     ),
              //   ],
              // ),
            ),
          ),
          //  InAppWebView(
//                   onLoadResource: (controller, resource) {
//                     LocalStorage(controller);
//                   },
//                   //  zoomEnabled: true,
//                   // geolocationEnabled: true,
//                   // gestureNavigationEnabled: true,
//                   // gestureRecognizers: true,
//                   // allowsInlineMediaPlayback: true,
//                   // debuggingEnabled: true,
//                   // backgroundColor: Colors.white,

//                   // javascriptMode: JavascriptMode.unrestricted,

//                   initialUrlRequest:
//                       URLRequest(url: Uri.parse("https://faham.org/#/login")),
// // webview.loadUrl(urlRequest: URLRequest(url: )
//                   // initialUrl: "https://faham.org/#/login",
//                   onWebViewCreated: (InAppWebViewController controller) {
//                     webview = controller;
//                   },
//                   onProgressChanged:
//                       (InAppWebViewController controller, int progress) =>
//                           setState(() {
//                             this.progress = progress / 100;
//                           }),
//                   initialOptions: InAppWebViewGroupOptions(
//                     android: AndroidInAppWebViewOptions(
//                       disableDefaultErrorPage: false,
//                       // useHybridComposition: true,
//                       loadsImagesAutomatically: true,
//                       supportMultipleWindows: false,
//                       cacheMode: AndroidCacheMode.LOAD_DEFAULT,
//                     ),
//                     crossPlatform: InAppWebViewOptions(
//                         mediaPlaybackRequiresUserGesture: false,
//                         javaScriptEnabled: true,
//                         allowFileAccessFromFileURLs: true,
//                         allowUniversalAccessFromFileURLs: true),
//                     // onWindowFocus: (controller) => {},
//                   ),
//                   androidOnPermissionRequest:
//                       (InAppWebViewController controller, String origin,
//                           List<String> resources) async {
//                     return PermissionRequestResponse(
//                         resources: resources,
//                         action: PermissionRequestResponseAction.GRANT);
//                   }
//
// ),
          //  webf.WebView(
          // zoomEnabled: true,
          // geolocationEnabled: true,
          // gestureNavigationEnabled: true,
          // // gestureRecognizers: true,
          // allowsInlineMediaPlayback: true,
          // debuggingEnabled: true,
          // backgroundColor: Colors.white,

          // javascriptMode: JavascriptMode.unrestricted,
          // initialUrl: "https://faham.org/#/login",
          // onWebViewCreated: (controller) {
          //   this.controller = controller;
          // },
          // onProgress: (progress) => setState(() {
          //   this.progress = progress / 100;
          // }),
          // ),
        ],
      ),
    );
  }
}
