import 'package:flutter/material.dart';

import '../widgets/main_widget.dart';
import '../widgets/article_widget.dart';
import '../widgets/mountain_widget.dart';
import '../assets/colors.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        title: "Poentjak App",
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0, backgroundColor: Colors.white, title: CustomAppBar()),
        bottomNavigationBar: Container(
          height: 64,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8))),
          child: Row(
            children: <Widget>[
//                  Icon(Icons.home),
              customNavigationBarItem(Icons.home, 0),
              customNavigationBarItem(Icons.search, 1),
              customNavigationBarItem(Icons.favorite, 2),
            ],
          ),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
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
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
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
        ));
  }

  Widget customNavigationBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
        });
      },
      child: Container(
        height: 48,
        width: MediaQuery.of(context).size.width / 3,
        decoration: index == _selectedItemIndex
            ? BoxDecoration(color: Colors.blueAccent[100])
            : BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedItemIndex
              ? Colors.white
              : Colors.blueAccent[100],
        ),
      ),
    );
  }
}
