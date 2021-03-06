import 'package:flutter/material.dart';

class InboxPage extends StatefulWidget {
  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  TextEditingController messageController = TextEditingController();
  List messages = ["Broken", "Help", "Fix Me", "Crying", "Raped"];
  @override
  Widget build(BuildContext context) {
    dynamic receivedData = ModalRoute.of(context)!.settings.arguments;
    return SafeArea(
      child: Scaffold(
        /*appBar: AppBar(
          elevation: 0.0,
          title: Text(
            receivedData["username"],
            style: TextStyle(
              fontFamily: "Abel",
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
        body: Column(
          children: [
            // Header
            Container(
              height: 150.0,
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Back Button
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  // Profile Pic and Username
                  Column(
                    children: [
                      // Profile Picture
                      Container(
                        padding: EdgeInsets.only(bottom: 6.0),
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/images/avatars/" + receivedData["avatar"],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      // Username
                      Text(
                        receivedData["username"].toString().toLowerCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                          fontFamily: "Abel",
                          color: Colors.blueGrey[900]!,
                        ),
                      ),
                    ],
                  ),
                  // Settings + Profile
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Divider(color: Colors.blueGrey),
            //
          ],
        ),
        /*Container(
          //height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Header
              Expanded(
                child: Container(
                  height: 20.0,
                  color: Colors.grey,
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              // MESSAGES
              Expanded(
                child: ListView.builder(
                  itemCount: messages.length,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 60.0,
                      height: 40.0,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          margin: EdgeInsets.symmetric(
                              vertical: 4.0, horizontal: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            border: Border.all(color: Colors.grey, width: 1.4),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                              bottomLeft: Radius.circular(30.0),
                              bottomRight: Radius.circular(0.0),
                            ),
                          ),
                          child: FittedBox(
                            child: Text(
                              messages[index],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // INPUT BOX
              Container(
                color: Color(0xff222831),
                padding: EdgeInsets.only(left: 2.0, right: 8.0),
                child: Row(
                  children: [
                    // SOS BUTTON
                    IconButton(
                      icon: Icon(
                        Icons.error_outline_rounded,
                        color: Colors.blueGrey[200],
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(width: 4.0),
                    // MESSAGE INPUT
                    Expanded(
                      child: TextField(
                        maxLines: 1,
                        controller: messageController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "enter message...",
                          hintStyle: TextStyle(
                            fontFamily: "PatrickHand",
                            fontSize: 17.0,
                            color: Colors.blueGrey[200],
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontFamily: "PatrickHand",
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                    // SEND BUTTON
                    IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Colors.blueGrey[200],
                      ),
                      onPressed: () {
                        messages.add(messageController.text);
                        messageController.clear();
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),*/
      ),
    );
  }
}
