import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class VentViewer extends StatefulWidget {
  const VentViewer({
    Key? key,
    required this.avatar,
    required this.username,
    required this.vent,
    required this.details,
  }) : super(key: key);

  final String avatar;
  final String username;
  final String vent;
  final String details;

  @override
  _VentContainerState createState() => _VentContainerState();
}

class _VentContainerState extends State<VentViewer> {
  bool isLoved = false;
  bool isFriends = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12.0, right: 6.0, top: 10.0),
      margin: EdgeInsets.only(bottom: 10.0),
      //margin: EdgeInsets.only(top: 6.0, bottom: 2.0, left: 8.0, right: 8.0),
      decoration: BoxDecoration(
        /*border:
            Border.all(color: isLoved ? Colors.pink : Colors.black, width: 2.0),*/
        color: Colors.grey[200],
        //borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Username and Tag
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Username, Date and Profile Picture
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Picture
                  Container(
                    padding: EdgeInsets.only(bottom: 6.0),
                    width: 44.0,
                    height: 44.0,
                    decoration: BoxDecoration(
                      //color: Colors.black,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/images/avatars/" + widget.avatar,
                      ),
                    ),
                  ),
                  SizedBox(width: 6.0),
                  // Username and Date
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Username
                      Text(
                        widget.username.toLowerCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.0,
                          fontFamily: "Abel",
                          color: Colors.blueGrey[900]!,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      // Date
                      Text(
                        DateTime.now().hour.toString() +
                            ":" +
                            DateTime.now().minute.toString() +
                            "  " +
                            DateTime.now().day.toString() +
                            "-" +
                            DateTime.now().month.toString() +
                            "-" +
                            DateTime.now().year.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 9.0,
                          fontFamily: "Abel",
                          color: Colors.blueGrey[800]!, //?.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Follow Button
              /*IconButton(
                icon: isFriends
                    ? Icon(
                        Icons.check_box_outlined,
                        color: Colors.blue[800],
                      )
                    : Icon(
                        Icons.add_box_outlined,
                        color: Colors.grey[800],
                      ),
                onPressed: () {
                  isFriends = !isFriends;
                  setState(() {});
                },
              ),*/
              // Tag
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.0),
                margin: EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                  //color: Colors.black,
                  border: Border.all(color: Colors.grey[600]!),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  "Love".toLowerCase(),
                  style: TextStyle(
                    color: Colors.blueGrey[800],
                    fontSize: 13.0,
                    fontFamily: "PatrickHand",
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          // Title
          Text(
            widget.vent,
            style: TextStyle(
              color: Colors.blueGrey[800],
              fontFamily: "PatrickHand",
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 0.0),
          Divider(color: Colors.grey[500]),
          // Details
          Container(
            //height: 300.0,
            child: Text(
              widget.details,
              style: TextStyle(
                color: Colors.blueGrey[800],
                fontFamily: "PatrickHand",
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
