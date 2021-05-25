import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'dart:math';

class ChatPage extends StatefulWidget {
  const ChatPage({
    Key? key,
    required this.fetchingContent,
    required this.fetchRedditConfessions,
  }) : super(key: key);
  final bool fetchingContent;
  final List fetchRedditConfessions;
  @override
  _ChatPageState createState() => _ChatPageState();
}

Random random = Random();

class _ChatPageState extends State<ChatPage> {
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
    return widget.fetchingContent
        ? Container(
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.black,
              ),
            ),
          )
        : ListView.builder(
            itemCount: widget.fetchRedditConfessions.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    // Profile Pic, Username, Messgae Preview and Send Button
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Profile Pic
                        Container(
                          width: 44.0,
                          height: 44.0,
                          padding: EdgeInsets.only(bottom: 6.0),
                          decoration: BoxDecoration(
                            //color: Colors.blueGrey[400],
                            border: Border.all(color: Colors.blueGrey[800]!),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: Center(
                            child: Image.asset("assets/images/avatars/" +
                                avatars[random.nextInt(15)]),
                          ),
                        ),
                        // Username and Message Preview
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Username
                            Text(
                              widget.fetchRedditConfessions[index]["author"]
                                  .toString()
                                  .toLowerCase(),
                              style: TextStyle(
                                color: Colors.blueGrey[900],
                                fontFamily: "Abel",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // Message Preview
                            SizedBox(
                              width: 230.0,
                              child: Text(
                                widget.fetchRedditConfessions[index]["title"],
                                style: TextStyle(
                                  fontFamily: "PatrickHand",
                                  color: Colors.blueGrey[700],
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 20.0),
                        // Send Button
                        IconButton(
                          icon: Icon(
                            Icons.send,
                            color: Colors.blueGrey[900],
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              "inboxPage",
                              arguments: {
                                "username": widget.fetchRedditConfessions[index]
                                    ["author"]
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1.0,
                    color: Colors.grey[400],
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
