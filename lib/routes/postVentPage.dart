import 'package:flutter/material.dart';

class PostVentPage extends StatefulWidget {
  @override
  _PostVentPageState createState() => _PostVentPageState();
}

class _PostVentPageState extends State<PostVentPage> {
  bool isTagged = false;
  dynamic _diet;
  TextEditingController ventTitleController = TextEditingController();
  TextEditingController ventDetailsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        /*// App Bar
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "Confess",
            style: TextStyle(
              color: Colors.grey[300],
              fontFamily: "Aladin",
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xff222831)),
              ),
              child: Row(
                children: [
                  /*Text("Post"),
                  SizedBox(width: 8.0),*/
                  Icon(
                    Icons.post_add,
                    //color: Colors.blue[400],
                  ),
                ],
              ),
            ),
            /*TextButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.post_add,
              ),
              label: Text(
                "Post",
              ),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
            ),*/
          ],
        ),
        */
        // Body
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Title, Details and Tags
              Container(
                //padding: EdgeInsets.only(left: 6.0, right: 6.0),
                margin: EdgeInsets.all(6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextFormField(
                        minLines: 1,
                        maxLines: 2,
                        controller: ventTitleController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Title...",
                          hintStyle: TextStyle(
                            fontSize: 18.0,
                            fontFamily: "PatrickHand",
                            color: Colors.blueGrey[700],
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: "PatrickHand",
                          color: Colors.blueGrey[700],
                        ),
                      ),
                    ),
                    Divider(color: Colors.grey[400], thickness: 1.0),
                    // Vent Details
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 300.0,
                      child: TextFormField(
                        minLines: 1,
                        maxLines: 7,
                        controller: ventDetailsController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Let It Out...",
                          hintStyle: TextStyle(
                            color: Colors.blueGrey[800],
                            fontFamily: "PatrickHand",
                            fontSize: 19.0,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.blueGrey[800],
                          fontFamily: "PatrickHand",
                          fontSize: 19.0,
                        ),
                      ),
                    ),
                    Divider(color: Colors.grey[400], thickness: 1.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
