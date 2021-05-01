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
        backgroundColor: Colors.grey[300],
        elevation: 0.0,
        title: Text(
          "CONFESS",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Aladin",
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          VentContainer(
            username: receivedData["confessionObj"]["author"],
            vent: receivedData["confessionObj"]["title"],
            details: receivedData["confessionObj"]["selftext"],
          ),
        ],
      ),
    );
  }
}
