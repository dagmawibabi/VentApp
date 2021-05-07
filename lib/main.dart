import 'package:flutter/material.dart';
import 'package:ventapp/routes/chatPage.dart';
import 'package:ventapp/routes/feedPage.dart';
import 'package:ventapp/routes/homePage.dart';
import 'package:ventapp/routes/inboxPage.dart';
import 'package:ventapp/routes/loadingPage.dart';
import 'package:ventapp/routes/onboardingPage.dart';
import 'package:ventapp/routes/postVentPage.dart';
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
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        iconTheme: IconThemeData(
          color: Colors.black, //grey[600],
        ),
        accentColor: Colors.grey[300],
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff222831),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xff222831),
          selectedIconTheme: IconThemeData(
            color: Colors.white,
          ),
          selectedLabelStyle: TextStyle(
            color: Colors.white,
          ),
          selectedItemColor: Colors.white,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xff222831),
          foregroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.blueGrey, //Color(0xff79a3b1),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.black,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            //elevation: MaterialStateProperty.all(),
            backgroundColor: MaterialStateProperty.all(Colors.blueGrey[600]),
            //backgroundColor: MaterialStateProperty.all(Colors.grey[900]),
            foregroundColor: MaterialStateProperty.all(Colors.grey[300]),
            //minimumSize: MaterialStateProperty.all(Size.fromHeight(20.0)),
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      initialRoute: "onboardingPage",
      routes: {
        "/": (context) => LoadingPage(),
        "onboardingPage": (context) => OnBoardingPage(),
        "homePage": (context) => HomePage(),
        //"feedPage": (context) => FeedPage(),
        //"chatPage": (context) => ChatPage(),
        "viewVents": (context) => ViewVents(),
        "inboxPage": (context) => InboxPage(),
        "postVentPage": (context) => PostVentPage(),
      },
    );
  }
}
