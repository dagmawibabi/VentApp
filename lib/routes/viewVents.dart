import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ventapp/UIElements/ventContainer.dart';
import 'package:ventapp/UIElements/ventViewer.dart';

void main() {
  runApp(ViewVents());
}

class ViewVents extends StatefulWidget {
  @override
  _ViewVentsState createState() => _ViewVentsState();
}

Random random = Random();

class _ViewVentsState extends State<ViewVents> {
  dynamic receivedData;
  List avatars = [
    "A.png",
    "B.png",
    "C.png",
    "D.png",
    "E.png",
    "F.png",
    "G.png",
    "H.png",
    "I.png",
    "J.png",
    "K.png",
    "L.png",
    "M.png",
    "N.png",
    "O.png",
  ];
  @override
  Widget build(BuildContext context) {
    receivedData = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      /*appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "CONFESS",
          style: TextStyle(
            fontFamily: "Aladin",
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
            ),
            onPressed: () {},
          ),
        ],
      ),*/
      body: ListView(
        children: [
          // Content
          Hero(
            tag: receivedData["confessionObj"]["author"],
            child: VentViewer(
              avatar: avatars[random.nextInt(avatars.length)],
              username: receivedData["confessionObj"]["author"],
              vent: receivedData["confessionObj"]["title"],
              details: receivedData["confessionObj"]["selftext"],
            ),
          ),
        ],
      ),
    );
  }
}
