import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class VentContainer extends StatefulWidget {
  const VentContainer({
    Key? key,
    required this.avatar,
    required this.username,
    required this.vent,
    required this.details,
    required this.users,
  }) : super(key: key);

  final String avatar;
  final String username;
  final String vent;
  final String details;
  final Map users;

  @override
  _VentContainerState createState() => _VentContainerState();
}

class _VentContainerState extends State<VentContainer> {
  bool isLoved = false;
  bool isFriends = false;
  Map confessionObj = {};
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    print(widget.users.entries.elementAt(0).key);
    confessionObj = {
      "author": widget.username,
      "title": widget.vent,
      "selftext": widget.details,
    };
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
                          fontFamily: "Abel",
                          fontSize: 13.0,
                          color: Colors.blueGrey[900]!,
                          fontWeight: FontWeight.bold,
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
          // Content
          Text(
            widget.vent,
            style: TextStyle(
              color: Colors.blueGrey[900],
              fontFamily: "PatrickHand",
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 0.0),
          Divider(
            color: Colors.grey[200],
            thickness: 0.3,
          ),
          // Engagements
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Like Button
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
              // Comments
              IconButton(
                icon: Icon(
                  LineIcons.comment,
                  color: Colors.grey[800],
                  //size: 20.0,
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "viewVents",
                    arguments: {
                      "confessionObj": confessionObj,
                    },
                  );
                },
              ),
              // Direct Message
              IconButton(
                icon: Icon(
                  Icons.send,
                  color: Colors.grey[800],
                  //size: 20.0,
                ),
                onPressed: () {},
              ),
              // Share button
              IconButton(
                icon: Icon(
                  Icons.share_outlined,
                  color: Colors.grey[800],
                  //size: 20.0,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.grey[200],
                    //isScrollControlled: true,
                    isDismissible: true,
                    context: context,
                    builder: (context) {
                      return Container(
                        margin: EdgeInsets.only(top: 4.0),
                        child: GridView.count(
                          crossAxisCount: 4,
                          shrinkWrap: true,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          children: List.generate(
                            widget.users.length - 1,
                            (index) {
                              return GestureDetector(
                                onTap: () {
                                  isSelected = !isSelected;
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    /*color: isSelected
                                        ? Colors.grey[300]
                                        : Colors.grey[200],*/
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // Profile Picture
                                      Container(
                                        width: 60.0,
                                        height: 60.0,
                                        margin: EdgeInsets.symmetric(
                                            vertical: 4.0, horizontal: 8.0),
                                        padding: EdgeInsets.only(
                                            bottom: 12.0,
                                            top: 6.0,
                                            left: 6.0,
                                            right: 6.0),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: isSelected
                                                  ? Colors.pink
                                                  : Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        child: Center(
                                            child: Image.asset(
                                                "assets/images/avatars/" +
                                                    widget.users.entries
                                                        .elementAt(index)
                                                        .value)),
                                      ),
                                      // Username
                                      Container(
                                        child: Center(
                                          child: Text(
                                            widget.users.entries
                                                .elementAt(index)
                                                .key
                                                .toString(),
                                            style: TextStyle(
                                              fontFamily: "Abel",
                                              fontSize: 13.0,
                                              color: Colors.blueGrey[900]!,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ),
                                        /*widget.users.entries
                                              .elementAt(index)
                                              .key
                                              .toString(),*/
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
