import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "CONFESS",
          style: TextStyle(
            color: Colors.blueGrey[800],
            fontFamily: "Aladin",
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
