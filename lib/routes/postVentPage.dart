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
                  Container(
                    color: Colors.blueGrey,
                    /*width: 120.0,
                    height: 40.0,*/
                    child: DropdownButtonFormField(
                      items: ["A", "B", "C"].map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _diet = value;
                        });
                      },
                      value: _diet,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.black,
                      ),
                      iconSize: 12.0,
                      elevation: 8,
                      isDense: false,
                      style: TextStyle(color: Colors.black),
                      isExpanded: true,
                      decoration: InputDecoration(
                        labelText: "Tag",
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      dropdownColor: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            // Tags
            /*Container(
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
            ), */
          ],
        ),
      ),
    );
  }
}
