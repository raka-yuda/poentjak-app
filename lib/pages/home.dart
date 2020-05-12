import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/widgets/main_widget.dart';
import 'package:test_app/widgets/article_widget.dart';
import 'package:test_app/widgets/mountain_widget.dart';
import '../assets/colors.dart';
import '../models/mount_model.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//       theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<BottomNavigationBarProvider>(
        child: BottomNavigationBarExample(),
        builder: (BuildContext context) => BottomNavigationBarProvider(),
      ),
//        Scaffold(
//            backgroundColor: Colors.white,
//            appBar: AppBar(
//                elevation: 0,
//                backgroundColor: Colors.white,
//                title: CustomAppBar()),
//            body: ListView(
//              scrollDirection: Axis.vertical,
//              children: <Widget>[
//                Padding(
//                  padding:
//                      const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
//                  child: Stack(children: <Widget>[
//                    Container(
//                      margin: EdgeInsets.only(top: 18, left: 4),
//                      height: 10,
//                      width: 132,
//                      color: shadeBlue,
//                    ),
//                    Text(
//                      'Unique Facts',
//                      style: TextStyle(
//                          fontSize: 28,
//                          color: darkBlue,
//                          fontWeight: FontWeight.w900),
//                    ),
//                  ]),
//                ),
//                ArticleCarousel(),
//                Padding(
//                  padding:
//                      const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
//                  child: Stack(children: <Widget>[
//                    Container(
//                      margin: EdgeInsets.only(top: 18, left: 4),
//                      height: 10,
//                      width: 132,
//                      color: shadeBlue,
//                    ),
//                    Text(
//                      'Arround You',
//                      style: TextStyle(
//                          fontSize: 28,
//                          color: darkBlue,
//                          fontWeight: FontWeight.w900),
//                    ),
//                  ]),
//                ),
//                ListMount(),
//              ],
//            ))
      //     Scaffold(
      //   body: Center(
      //     child: CardMount(),
      //   ),
      // )

      // HeroTest()
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  @override
  _BottomNavigationBarExampleState createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  var currentTab = [
    Home1(),
    Profile(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      body: currentTab[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.currentIndex = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: new Text('Profile'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          )
        ],
      ),
    );
  }
}

class Home1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        alignment: Alignment.center,
        height: 300,
        width: 300,
        child: Text(
          "Home",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        color: Colors.amber,
      )),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: 300,
          width: 300,
          child: Text(
            "Profile",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          color: Colors.blue,
        ),
      ),
    );
  }
}

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        alignment: Alignment.center,
        height: 300,
        width: 300,
        child: Text(
          "Settings",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        color: Colors.cyan,
      )),
    );
  }
}

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;

  get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
