import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/search.dart';
import 'pages/favorite.dart';

void main() => runApp(Poentjak());

class Poentjak extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Poentjak App",
      theme: ThemeData(
        fontFamily: 'google-font',
      ),
      initialRoute: Home.id,
      routes: {
        Home.id: (context) => Home(),
        SearchPage.id: (context) => SearchPage(),
        FavoritePage.id: (context) => FavoritePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
