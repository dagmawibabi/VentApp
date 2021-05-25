import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ventapp/UIElements/redditVentContainer.dart';
import 'package:ventapp/UIElements/ventContainer.dart';
import 'package:ventapp/services/fetchReddit.dart';
import 'dart:math';
/*void main() {
  runApp(FeedPage());
}*/

class FeedPage extends StatefulWidget {
  const FeedPage({
    Key? key,
    required this.fetchingContent,
    required this.fetchRedditConfessions,
  }) : super(key: key);
  final bool fetchingContent;
  final List fetchRedditConfessions;
  @override
  _FeedPageState createState() => _FeedPageState();
}

Random random = new Random();
bool isLoved = false;

class _FeedPageState extends State<FeedPage> {
  int randomNumber1 = random.nextInt(9);
  int randomNumber2 = random.nextInt(9);
  int randomNumber3 = random.nextInt(9);
  int randomNumber4 = random.nextInt(9);
  int randomNumber5 = random.nextInt(9);
  List illustrations = [
    "Anonymous.png",
    "Free.png",
    "Secure.png",
    "LetItOut.png",
    "11.png",
    "12.png",
    "Community.png",
    "Welcome.png",
    "Loading1.png",
  ];
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
  Map users = {};
  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < widget.fetchRedditConfessions.length; i++) {
      users[widget.fetchRedditConfessions[i]["author"]] =
          avatars[random.nextInt(avatars.length)];
    }
    return widget.fetchingContent
        // Loading Illustration
        ? Container(
            //color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Center(
                  child: Container(
                    width: 230,
                    height: 230, //120.0,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset("assets/images/loading1.png"),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: 150.0,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.black,
                      minHeight: 5.0,
                    ),
                  ),
                ),
                Spacer(),
                Spacer(),
              ],
            ),
          )
        // Content
        : ListView.builder(
            itemCount: widget.fetchRedditConfessions.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  /*index == randomNumber1 ||
                          index == randomNumber2 ||
                          index == randomNumber3 ||
                          index == randomNumber4 ||
                          index == randomNumber5
                      ? Container(
                          padding: EdgeInsets.all(3.0),
                          //padding: EdgeInsets.only(left: 12.0, right: 6.0),
                          margin: EdgeInsets.only(
                              top: 6.0, bottom: 2.0, left: 8.0, right: 8.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.blueGrey[700]!, width: 6.0),
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/" + illustrations[index],
                              ),
                              IconButton(
                                icon: Icon(
                                  isLoved == true
                                      ? LineIcons.heartAlt
                                      : LineIcons.heart,
                                  //size: 20.0,
                                ),
                                onPressed: () {
                                  isLoved = !isLoved;
                                  setState(() {});
                                },
                                color: isLoved ? Colors.pink : Colors.grey[800],
                              ),
                            ],
                          ),
                        )
                      : Container(),*/
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "viewVents",
                        arguments: {
                          "confessionObj": widget.fetchRedditConfessions[index],
                        },
                      );
                    },
                    child: Hero(
                      tag: widget.fetchRedditConfessions[index]["title"],
                      child: Column(
                        children: [
                          VentContainer(
                            avatar: avatars[random.nextInt(avatars.length)],
                            username: widget.fetchRedditConfessions[index]
                                ["author"],
                            vent: widget.fetchRedditConfessions[index]["title"],
                            details: widget.fetchRedditConfessions[index]
                                ["selftext"],
                            users: users,
                          ),
                          Divider(
                            height: 1.0,
                            color: Colors.grey[600],
                          ),
                          //SizedBox(height: 20.0),
                        ],
                      ),
                    ),
                  ),
                  index == widget.fetchRedditConfessions.length - 1
                      ? SizedBox(height: 100.0)
                      : SizedBox(),
                ],
              );
            },
          );
  }
}
