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

class _HomePageState extends State<HomePage> {
  bool fetchingContent = true;
  List fetchRedditConfessions = [];
  String fetchState = "Connecting...";
  void getRedditConfessions() async {
    try {
      FetchReddit fetchReddit = FetchReddit();
      await fetchReddit.getRedditConfessions();
      fetchRedditConfessions = fetchReddit.confessions;
      fetchState = "Connected!";
      setState(() {});
      //TIME OUT
      Future.delayed(Duration(milliseconds: 800), () {
        fetchState = "Confess";
        fetchingContent = false;
        setState(() {});
      });
    } catch (e) {
      fetchState = "Not-Connected!";
      //curPage = 100;
      getRedditConfessions();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getRedditConfessions();
  }

  int curPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // App Bar
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          fetchState,
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
      ),
      // Body
      body: pagesChoice(),
      /*curPage == 0
          ? FeedPage(
              fetchingContent: fetchingContent,
              fetchRedditConfessions: fetchRedditConfessions,
            )
          : ChatPage(
              fetchingContent: fetchingContent,
              fetchRedditConfessions: fetchRedditConfessions,
            ),*/
      // Bottom Nav Bar
      bottomNavigationBar: BottomAppBar(
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
      ),
      // FAB
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.edit_outlined,
        ),
        onPressed: () {
          Navigator.pushNamed(context, "postVentPage");
        },
      ),
    );
  }

  dynamic pagesChoice() {
    if (curPage == 0) {
      return FeedPage(
        fetchingContent: fetchingContent,
        fetchRedditConfessions: fetchRedditConfessions,
      );
    } else if (curPage == 1) {
      return ChatPage(
        fetchingContent: fetchingContent,
        fetchRedditConfessions: fetchRedditConfessions,
      );
    } else {
      return Center(
        child: Container(
          height: 230, //120.0,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset(
                "assets/images/error" + random.nextInt(11).toString() + ".png"),
          ),
        ),
      );
    }
  }
}
