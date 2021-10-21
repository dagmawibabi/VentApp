import 'dart:convert';
import 'package:http/http.dart';

class FetchReddit {
  List confessions = [];
  Future<void> getRedditConfessions() async {
    Response response =
        await get(Uri.parse("https://www.reddit.com/r/confession.json"));
    dynamic responseJSON = jsonDecode(response.body);
    for (var i = 1; i < responseJSON["data"]["dist"]; i++) {
      confessions.add(responseJSON["data"]["children"][i]["data"]);
    }
    //print(responseJSON);
  }
}
