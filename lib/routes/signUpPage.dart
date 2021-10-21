import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameController = TextEditingController();
  bool errrorInput = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "CONFESS",
          style: TextStyle(
            color: Colors.blueGrey[800],
            fontFamily: "Aladin",
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.blueGrey[900],
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Image.asset("assets/images/signupLogin/signUp1.png"),
            Spacer(),
            // Username Sign Up
            Container(
              margin: EdgeInsets.only(left: 70.0),
              child: Text(
                "Username",
                style: TextStyle(
                  color: Colors.blueGrey[900],
                  fontFamily: "Abel",
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Username Input
            Container(
              margin: EdgeInsets.only(
                  top: 4.0, bottom: 8.0, left: 50.0, right: 50.0),
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: TextField(
                controller: usernameController,
                maxLines: 1,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: Colors.blueGrey[800],
                  fontFamily: "Abel",
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
                onChanged: (userInput) {
                  if (userInput.characters.toString().contains(" ")) {
                    errrorInput = true;
                    setState(() {});
                  } else {
                    errrorInput = false;
                    setState(() {});
                  }
                },
              ),
            ),
            // Anonymous Sign Up
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, "homePage");
              },
              child: Container(
                margin: EdgeInsets.only(left: 50.0),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 62.0),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[900],
                  border: Border.all(
                    color: Colors.blueGrey[900]!,
                  ),
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: Text(
                  "Sign Up Anonymously",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: "Abel",
                    color: Colors.grey[100],
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ),
            // Error Message
            Container(
              margin: EdgeInsets.only(bottom: 8.0, left: 70.0),
              child: Text(
                errrorInput ? "Username can't contain spaces" : "",
                style: TextStyle(
                  color: errrorInput ? Colors.red : Colors.blueGrey[900],
                  fontFamily: "Abel",
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Spacer(),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
