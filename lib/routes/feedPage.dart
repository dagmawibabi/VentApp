import 'package:flutter/material.dart';
import 'package:ventapp/UIElements/ventContainer.dart';
import 'package:ventapp/services/fetchReddit.dart';

void main() {
  runApp(FeedPage());
}

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  bool fetchingContent = true;
  List fetchRedditConfessions = [];
  void getRedditConfessions() async {
    print("here1");
    FetchReddit fetchReddit = FetchReddit();
    await fetchReddit.getRedditConfessions();
    fetchRedditConfessions = fetchReddit.confessions;
    print("here2");
    fetchingContent = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    print("herex");
    getRedditConfessions();
  }

  @override
  Widget build(BuildContext context) {
    return fetchingContent
        ? Container(
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.black,
              ),
            ),
          )
        : ListView.builder(
            itemCount: fetchRedditConfessions.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "viewVents",
                        arguments: {
                          "confessionObj": fetchRedditConfessions[index],
                        },
                      );
                    },
                    child: VentContainer(
                      username: fetchRedditConfessions[index]["author"],
                      vent: fetchRedditConfessions[index]["title"],
                      details: "PASS-NULL-EMPTY",
                    ),
                  ),
                  index == fetchRedditConfessions.length - 1
                      ? SizedBox(height: 100.0)
                      : SizedBox(),
                ],
              );
            },
          );
  }
}
