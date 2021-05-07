import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class VentContainer extends StatefulWidget {
  const VentContainer({
    Key? key,
    required this.username,
    required this.vent,
    required this.details,
  }) : super(key: key);

  final String username;
  final String vent;
  final String details;

  @override
  _VentContainerState createState() => _VentContainerState();
}

class _VentContainerState extends State<VentContainer> {
  bool isLoved = false;
  bool isFriends = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12.0, right: 6.0),
      margin: EdgeInsets.only(top: 6.0, bottom: 2.0, left: 8.0, right: 8.0),
      decoration: BoxDecoration(
        /*border:
            Border.all(color: isLoved ? Colors.pink : Colors.black, width: 2.0),*/
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "@" + widget.username,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Abel",
                  color: Colors.blueGrey[800]?.withOpacity(0.8),
                ),
              ),
              /*ElevatedButton.icon(
                label: Text("Follow"),
                icon: Icon(Icons.add_box_outlined),
                onPressed: () {},
              ),*/
              IconButton(
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
              ),
            ],
          ),
          SizedBox(height: 5.0),
          /*Divider(
            color: Colors.black,
            thickness: 1.0,
          ),*/
          //SizedBox(height: 5.0),
          Text(
            widget.vent,
            style: TextStyle(
              color: Colors.blueGrey[900],
              fontFamily: "PatrickHand",
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 10.0),
          Divider(
            color: Colors.grey[600],
            thickness: 1.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  isLoved == true ? LineIcons.heartAlt : LineIcons.heart,
                  //size: 20.0,
                ),
                onPressed: () {
                  isLoved = !isLoved;
                  setState(() {});
                },
                color: isLoved ? Colors.pink : Colors.grey[800],
              ),
              IconButton(
                icon: Icon(
                  LineIcons.comment,
                  color: Colors.grey[800],
                  //size: 20.0,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.send,
                  color: Colors.grey[800],
                  //size: 20.0,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.share_outlined,
                  color: Colors.grey[800],
                  //size: 20.0,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
