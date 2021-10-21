import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ventapp/routes/chatPage.dart';
import 'package:ventapp/routes/feedPage.dart';
import 'package:ventapp/services/fetchReddit.dart';
import 'dart:math';

void main() {
  runApp(HomePage());
}

Random random = Random();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int curPage = 0;
  List fetchRedditConfessions = [];
  String connectionState = "fetching";
  List errorIllustrations = [
    "error1",
    "error3",
    "error4",
    "error5",
    "error6",
    "error8",
    "error9",
    "error10",
    "error11"
  ];
  List loadingIllustrations = ["loading1", "loading2", "loading3"];
  // Fetch Reddit Content
  void getRedditConfessions() async {
    try {
      FetchReddit fetchReddit = FetchReddit();
      await fetchReddit.getRedditConfessions();
      fetchRedditConfessions = fetchReddit.confessions;
      setState(() {});
      // Timeout
      Future.delayed(
        Duration(milliseconds: 800),
        () {
          connectionState = "fetched";
          setState(() {});
        },
      );
    } catch (e) {
      connectionState = "errorFetching";
      setState(() {});
    }
  }

  // Give feedback of process and display correct pages
  dynamic pagesChoice() {
    // If fetching, show a loading message
    if (connectionState == "fetching") {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            // Random Loading Illustration
            Container(
              width: 230,
              height: 230,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset("assets/images/feedback/loading/" +
                    loadingIllustrations[
                        random.nextInt(loadingIllustrations.length)] +
                    ".png"),
              ),
            ),
            SizedBox(height: 20.0),
            // Loading Message
            Text(
              "Fetching Content...",
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: "Abel",
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(height: 50.0),
            // Horizontal Loading Bar
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
      );
    }
    // If error fetching, show an error message
    else if (connectionState == "errorFetching") {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            // Random Error Illustration
            Container(
              width: 230,
              height: 230,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset("assets/images/feedback/error/" +
                    errorIllustrations[
                        random.nextInt(errorIllustrations.length)] +
                    ".png"),
              ),
            ),
            SizedBox(height: 20.0),
            // Error Message
            Text(
              "Error Fetching Content",
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: "Abel",
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(height: 50.0),
            // Retry Button
            ElevatedButton(
              onPressed: () {
                connectionState = "fetching";
                setState(() {});
                getRedditConfessions();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color(0xff222831),
                ),
              ),
              child: Text(
                "    Retry    ",
                style: TextStyle(
                  fontFamily: "Abel",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            Spacer(),
            Spacer(),
          ],
        ),
      );
    }
    // If complete fetching, show the appropriate page
    else if (connectionState == "fetched") {
      return Container();
    }
  }

  @override
  void initState() {
    super.initState();
    getRedditConfessions();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabBarController = TabController(length: 2, vsync: this);
    PageController mainPagesController = PageController(initialPage: 0);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.grey[200],
      statusBarIconBrightness: Brightness.dark,
    ));
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          extendBody: true,
          // App Bar
          /*appBar: TabBar(
            controller: tabBarController,
            indicatorColor: Colors.blueGrey[100],
            unselectedLabelColor: Colors.blueGrey[400],
            labelColor: Colors.blueGrey[900],
            tabs: [
              Icon(
                Icons.home_outlined,
              ),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(pi),
                child: Icon(
                  Icons.chat_bubble_outline,
                ),
              ),
            ],
          ),*/
          /*appBar: AppBar(
            elevation: 0.0,
            title: Text(
              "Confess",
              style: TextStyle(
                fontFamily: "Aladin",
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
          // Body
          body: connectionState == "fetched"
              ? PageView(
                  controller: mainPagesController,
                  children: [
                    FeedPage(fetchRedditConfessions: fetchRedditConfessions),
                    ChatPage(fetchRedditConfessions: fetchRedditConfessions),
                  ],
                )
              : pagesChoice(),
          // Bottom Nav Bar
          /*bottomNavigationBar: BottomAppBar(
            elevation: 0.0,
            notchMargin: 5.0,
            clipBehavior: Clip.antiAlias,
            shape: CircularNotchedRectangle(),
            child: BottomNavigationBar(
              onTap: (index) {
                curPage = index;
                setState(() {});
              },
              iconSize: 26.0,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              currentIndex: curPage,
              items: [
                BottomNavigationBarItem(
                  label: "Home",
                  activeIcon: Icon(
                    Icons.home,
                  ),
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Chat",
                  activeIcon: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(pi),
                    child: Icon(
                      Icons.chat,
                    ),
                  ),
                  icon: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(pi),
                    child: Icon(
                      Icons.chat_bubble_outline,
                    ),
                  ),
                ),
              ],
            ),
          ),*/

          // FAB
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.edit_outlined,
            ),
            onPressed: () {
              Navigator.pushNamed(context, "postVentPage");
            },
          ),
        ),
      ),
    );
  }
}
