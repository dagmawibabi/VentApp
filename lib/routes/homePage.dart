import 'package:flutter/material.dart';
import 'package:ventapp/routes/chatPage.dart';
import 'package:ventapp/routes/feedPage.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int curPage = 0;
  List routes = [FeedPage(), ChatPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey[300], //deepPurpleAccent[200], //,
      // App Bar
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0.0,
        title: Text(
          "CONFESS",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Aladin",
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      // Body
      body: routes[curPage],
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
          backgroundColor: Colors.grey[200],
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey[600],
          showSelectedLabels: true,
          showUnselectedLabels: false,
          currentIndex: curPage,
          items: [
            /*BottomNavigationBarItem(
              label: "Search",
              icon: Icon(
                Icons.search,
              ),
            ),*/
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
              activeIcon: Icon(Icons.chat),
              icon: Icon(
                Icons.chat_bubble_outline,
              ),
            ),
          ],
        ),
      ),
      // FAB
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(
          Icons.edit_outlined,
        ),
        onPressed: () {},
      ),
    );
  }
}
