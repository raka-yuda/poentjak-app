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
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 25.0, // soften the shadow
                spreadRadius: 5.0, //extend the shadow
                offset: Offset(
                  0, // Move to right 10  horizontally
                  15.0, // Move to bottom 10 Vertically
                ),
              )
            ],
          ),
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
            titleSection('Unique Facts'),
            ArticleCarousel(),
            titleSection('Arround You'),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                color: index == _selectedItemIndex
                    ? Colors.blueAccent[600]
                    : Colors.blueAccent[100],
              ),
              SizedBox(
                height: 8,
              ),
              index == _selectedItemIndex
                  ? Container(
                      width: 12,
                      height: 8,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent[100],
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    )
                  : Container()
            ],
          )),
    );
  }

  Widget titleSection(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: Stack(children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 18, left: 4),
          height: 10,
          width: 132,
          color: shadeBlue,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 28, color: darkBlue, fontWeight: FontWeight.w900),
        ),
      ]),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.blueAccent[100],
      child: Center(
        child: Container(
          child: Icon(
            Icons.home,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
