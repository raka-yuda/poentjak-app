import 'package:flutter/material.dart';

import '../widgets/main_widget.dart';
import '../widgets/article_widget.dart';
import '../widgets/mountain_widget.dart';
import '../assets/colors.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//       theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                title: CustomAppBar()),
            bottomNavigationBar: Row(
              children: <Widget>[
                customNavigationBarItem(Icons.home, true),
                customNavigationBarItem(Icons.search, true),
                customNavigationBarItem(Icons.favorite, true),
              ],
            ),
            body: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                  child: Stack(children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 18, left: 4),
                      height: 10,
                      width: 132,
                      color: shadeBlue,
                    ),
                    Text(
                      'Unique Facts',
                      style: TextStyle(
                          fontSize: 28,
                          color: darkBlue,
                          fontWeight: FontWeight.w900),
                    ),
                  ]),
                ),
                ArticleCarousel(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                  child: Stack(children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 18, left: 4),
                      height: 10,
                      width: 132,
                      color: shadeBlue,
                    ),
                    Text(
                      'Arround You',
                      style: TextStyle(
                          fontSize: 28,
                          color: darkBlue,
                          fontWeight: FontWeight.w900),
                    ),
                  ]),
                ),
                ListMount(),
              ],
            )));
  }

  Widget customNavigationBarItem(IconData icon, bool isActive) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
          color: isActive ? Colors.blueAccent[100] : Colors.white),
      child: Icon(
        icon,
        color: isActive ? Colors.white : Colors.blueAccent[100],
      ),
    );
  }
}
