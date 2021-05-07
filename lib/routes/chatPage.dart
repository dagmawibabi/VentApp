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

class _ChatPageState extends State<ChatPage> {
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
                    margin: EdgeInsets.only(
                        top: 6.0, bottom: 2.0, left: 8.0, right: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 44.0,
                          height: 44.0,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[400],
                            border: Border.all(color: Colors.blueGrey[800]!),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: Center(
                            child: Text(
                              (widget.fetchRedditConfessions[index]["author"]
                                          [0] +
                                      widget.fetchRedditConfessions[index]
                                          ["author"][widget
                                              .fetchRedditConfessions[index]
                                                  ["author"]
                                              .length -
                                          1])
                                  .toString()
                                  .toUpperCase(),
                              style: TextStyle(
                                  color: Colors.blueGrey[900]!, fontSize: 12.0),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "@" +
                                  widget.fetchRedditConfessions[index]
                                      ["author"],
                              style: TextStyle(
                                color: Colors.blueGrey[900],
                                fontFamily: "Abel",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 6.0),
                            SizedBox(
                              width: 230.0,
                              child: Text(
                                "  " +
                                    widget.fetchRedditConfessions[index]
                                        ["title"],
                                style: TextStyle(
                                  fontFamily: "PatrickHand",
                                  color: Colors.blueGrey[700],
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            SizedBox(width: 20.0),
                          ],
                        ),
                        SizedBox(width: 20.0),
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
                  index == widget.fetchRedditConfessions.length - 1
                      ? SizedBox(height: 100.0)
                      : SizedBox(),
                ],
              );
            },
          );
  }
}
