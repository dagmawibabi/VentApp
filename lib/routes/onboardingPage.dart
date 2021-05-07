import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() {
  runApp(OnBoardingPage());
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  PageController onboardingPageController = PageController(initialPage: 0);
  bool skipped = false;
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
        actions: [
          IconButton(
            icon: Icon(
              skipped ? Icons.skip_previous_outlined : Icons.skip_next_outlined,
              color: Colors.blueGrey[800],
            ),
            onPressed: () {
              onboardingPageController.animateToPage(
                skipped ? 0 : 5,
                duration: Duration(milliseconds: 1200),
                curve: Curves.linear,
              );
              skipped = !skipped;
              setState(() {});
            },
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: PageView(
        controller: onboardingPageController,
        children: [
          // Page 1 - Welcome!
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Image
                Container(
                  padding: EdgeInsets.only(right: 30.0),
                  width: double.infinity,
                  height: 400.0,
                  child: Image.asset("assets/images/Welcome.png"),
                ),
                // Title and Body Text
                Container(
                  /*padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 60.0),*/
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10.0),
                      Text(
                        "WELCOME!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Abel",
                          fontSize: 20.0,
                          color: Colors.blueGrey[900],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Take A Tour Of Confess! \n \n \n",
                        style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: "PatrickHand",
                          color: Colors.blueGrey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                //Spacer(),
                SizedBox(height: 60.0),
                // Next Button
                GestureDetector(
                  onTap: () {
                    onboardingPageController.animateToPage(
                      1,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.linear,
                    );
                  },
                  child: Container(
                    width: 180.0,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[800],
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            TextButton(
                              child: Text(
                                "Begin Tour",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ), //grey[100]),
                              ),
                              onPressed: () {
                                onboardingPageController.animateToPage(
                                  1,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.linear,
                                );
                              },
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white, //grey[100],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          // Page 2 - Anonymous
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Image
                Container(
                  width: double.infinity,
                  height: 400.0,
                  child: Image.asset("assets/images/Anonymous.png"),
                ),
                // Title and Body Text
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Anonymous",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Abel",
                          fontSize: 20.0,
                          color: Colors.blueGrey[900],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "You create an anonymous account and your real identity is hidden. No one will know who you are! Not Even us! \n",
                        style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: "PatrickHand",
                          color: Colors.blueGrey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                //Spacer(),
                SizedBox(height: 50.0),
                // Next Button
                GestureDetector(
                  onTap: () {
                    onboardingPageController.animateToPage(
                      2,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.linear,
                    );
                  },
                  child: Container(
                    width: 150.0, //180.0,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[800],
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            TextButton(
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ), //grey[100]),
                              ),
                              onPressed: () {
                                onboardingPageController.animateToPage(
                                  2,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.linear,
                                );
                              },
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white, //grey[100],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          // Page 3 - Secure and Private
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Image
                Container(
                  width: double.infinity,
                  height: 400.0,
                  child: Image.asset("assets/images/Secure.png"),
                ),
                // Title and Body Text
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Secure and Private",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Abel",
                          fontSize: 20.0,
                          color: Colors.blueGrey[900],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Your vents, confessions and chats are all kept securly on our servers out of reach of anyone's hands! \n",
                        style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: "PatrickHand",
                          color: Colors.blueGrey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                //Spacer(),
                SizedBox(height: 50.0),
                // Next Button
                GestureDetector(
                  onTap: () {
                    onboardingPageController.animateToPage(
                      3,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.linear,
                    );
                  },
                  child: Container(
                    width: 150.0, //180.0,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[800],
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            TextButton(
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ), //grey[100]),
                              ),
                              onPressed: () {
                                onboardingPageController.animateToPage(
                                  3,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.linear,
                                );
                              },
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white, //grey[100],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          // Page 4 - Supporting Community
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Image
                Container(
                  width: double.infinity,
                  height: 400.0,
                  child: Image.asset("assets/images/Community.png"),
                ),
                // Title and Body Text
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Supporting Community",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Abel",
                          fontSize: 20.0,
                          color: Colors.blueGrey[900],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "The community is made up of people like you who just want to vent things out and get support back. So they have eachother's backs! Including yours! ",
                        style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: "PatrickHand",
                          color: Colors.blueGrey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                //Spacer(),
                SizedBox(height: 50.0),
                // Next Button
                GestureDetector(
                  onTap: () {
                    onboardingPageController.animateToPage(
                      4,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.linear,
                    );
                  },
                  child: Container(
                    width: 150.0, //180.0,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[800],
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            TextButton(
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ), //grey[100]),
                              ),
                              onPressed: () {
                                onboardingPageController.animateToPage(
                                  4,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.linear,
                                );
                              },
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white, //grey[100],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          // Page 5 - Alert Community
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Image
                Container(
                  width: double.infinity,
                  height: 400.0,
                  child: Image.asset("assets/images/Free.png"),
                ),
                // Title and Body Text
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Breakdown Alert",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Abel",
                          fontSize: 20.0,
                          color: Colors.blueGrey[900],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Feeling like you need immediate help? Just press the emergency(SOS) button and all available online users are notified and will be in touch with you soon! \n",
                        style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: "PatrickHand",
                          color: Colors.blueGrey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                //Spacer(),
                SizedBox(height: 50.0),
                // Next Button
                GestureDetector(
                  onTap: () {
                    onboardingPageController.animateToPage(
                      5,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.linear,
                    );
                  },
                  child: Container(
                    width: 150.0, //180.0,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[800],
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            TextButton(
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ), //grey[100]),
                              ),
                              onPressed: () {
                                onboardingPageController.animateToPage(
                                  5,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.linear,
                                );
                              },
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white, //grey[100],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          // Page 6 - Free Forever
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Image
                Container(
                  width: double.infinity,
                  height: 400.0,
                  child: Image.asset("assets/images/Free.png"),
                ),
                // Title and Body Text
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Free Forever",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Abel",
                          fontSize: 20.0,
                          color: Colors.blueGrey[900],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "All the services provided to you are completly free of charge forever! \n \n",
                        style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: "PatrickHand",
                          color: Colors.blueGrey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                //Spacer(),
                SizedBox(height: 50.0),
                // Next Button
                GestureDetector(
                  onTap: () {
                    onboardingPageController.animateToPage(
                      5,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.linear,
                    );
                  },
                  child: Container(
                    width: 150.0, //180.0,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[800],
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            TextButton(
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ), //grey[100]),
                              ),
                              onPressed: () {
                                onboardingPageController.animateToPage(
                                  5,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.linear,
                                );
                              },
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white, //grey[100],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          // Page 7 - Let It All Out
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Image
                Container(
                  width: double.infinity,
                  height: 400.0,
                  child: Image.asset("assets/images/LetItOut.png"),
                ),
                // Title and Body Text
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Let it all out!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Abel",
                          fontSize: 20.0,
                          color: Colors.blueGrey[900],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "You can vent and confess about anything on your mind. Set your mind free and say everything bothering you! \n",
                        style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: "PatrickHand",
                          color: Colors.blueGrey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                //Spacer(),
                SizedBox(height: 50.0),
                // Next Button
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "homePage");
                  },
                  child: Container(
                    width: 180.0,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[800],
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            TextButton(
                              child: Text(
                                "Get Started",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ), //grey[100]),
                              ),
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, "homePage");
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
