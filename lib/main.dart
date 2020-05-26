import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/search.dart';
import 'pages/favorite.dart';

void main() {
  runApp(MaterialApp(
//        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.white),
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => Home(),
      '/search': (context) => SearchPage(),
      '/favorite': (context) => FavoritePage(),
    },
    debugShowCheckedModeBanner: false,
    title: "Poentjak App",
  ));
}
