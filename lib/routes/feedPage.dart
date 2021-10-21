import 'package:flutter/material.dart';
import 'package:ventapp/UIElements/ventContainer.dart';
import 'dart:math';

class FeedPage extends StatefulWidget {
  const FeedPage({
    Key? key,
    required this.fetchRedditConfessions,
  }) : super(key: key);
  final List fetchRedditConfessions;
  @override
  _FeedPageState createState() => _FeedPageState();
}

Random random = new Random();
bool isLoved = false;

class _FeedPageState extends State<FeedPage> {
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
    // Content
    return ListView.builder(
      itemCount: widget.fetchRedditConfessions.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
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
              child: Column(
                children: [
                  VentContainer(
                    avatar: avatars[random.nextInt(avatars.length)],
                    username: widget.fetchRedditConfessions[index]["author"],
                    vent: widget.fetchRedditConfessions[index]["title"],
                    details: widget.fetchRedditConfessions[index]["selftext"],
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
            index == widget.fetchRedditConfessions.length - 1
                ? SizedBox(height: 100.0)
                : SizedBox(),
          ],
        );
      },
    );
  }
}
