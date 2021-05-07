import 'package:flutter/material.dart';
import 'package:ventapp/UIElements/ventContainer.dart';

void main() {
  runApp(ViewVents());
}

class ViewVents extends StatefulWidget {
  @override
  _ViewVentsState createState() => _ViewVentsState();
}

class _ViewVentsState extends State<ViewVents> {
  dynamic receivedData;
  @override
  Widget build(BuildContext context) {
    receivedData = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: ListView(
        children: [
          Hero(
            tag: receivedData["confessionObj"]["author"],
            child: VentContainer(
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
