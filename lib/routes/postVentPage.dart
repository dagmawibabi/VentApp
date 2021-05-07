import 'package:flutter/material.dart';

class PostVentPage extends StatefulWidget {
  @override
  _PostVentPageState createState() => _PostVentPageState();
}

class _PostVentPageState extends State<PostVentPage> {
  bool isTagged = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar
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
      // Body
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 6.0, right: 6.0),
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*Text(
                    "@Dagmawi_Babi",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Abel",
                      color: Colors.blueGrey[800]?.withOpacity(0.8),
                    ),
                  ),*/
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0, left: 8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Title...",
                        hintStyle: TextStyle(
                          color: Colors.blueGrey[700],
                          fontFamily: "PatrickHand",
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.blueGrey[700],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey[600],
                    thickness: 1.0,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                    height: 150.0,
                    /*decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blueGrey[500]!,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),*/
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Let It Out...",
                        hintStyle: TextStyle(
                          color: Colors.blueGrey[900],
                          fontFamily: "PatrickHand",
                          fontSize: 19.0,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.blueGrey[900],
                      ),
                    ),
                  ),
                  /*Divider(
                    color: Colors.grey[600],
                    thickness: 1.0,
                  ),*/
                  /*Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.post_add,
                          color: Colors.blueGrey[700],
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),*/
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
              decoration: BoxDecoration(
                color: isTagged ? Colors.grey[400] : Colors.blueGrey,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Love"),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Anger"),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Depression"),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Guilt"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Regrets"),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Personal"),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Family"),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Lonely"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        child: Text("Sexual"),
                        onPressed: () {
                          isTagged = !isTagged;
                          setState(() {});
                        },
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(
                            isTagged ? Colors.white : Colors.grey[300],
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            isTagged
                                ? Colors.blueGrey[900]
                                : Colors.blueGrey[600],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Self Harm"),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Crime"),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Hate"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
