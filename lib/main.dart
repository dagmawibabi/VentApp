import 'package:flutter/material.dart';
import 'package:ventapp/routes/chatPage.dart';
import 'package:ventapp/routes/feedPage.dart';
import 'package:ventapp/routes/homePage.dart';
import 'package:ventapp/routes/loadingPage.dart';
import 'package:ventapp/routes/viewVents.dart';

void main() {
  runApp(VentApp());
}

class VentApp extends StatefulWidget {
  @override
  _VentAppState createState() => _VentAppState();
}

class _VentAppState extends State<VentApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "homePage",
      routes: {
        "/": (context) => LoadingPage(),
        "homePage": (context) => HomePage(),
        "feedPage": (context) => FeedPage(),
        "viewVents": (context) => ViewVents(),
        "chatPage": (context) => ChatPage(),
      },
    );
  }
}
