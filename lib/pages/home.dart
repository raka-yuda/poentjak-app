import 'package:flutter/material.dart';
import 'package:test_app/widgets/main_widget.dart';
import 'package:test_app/widgets/news_carousel.dart';
import '../assets/colors.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//       theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                title: CustomAppBar()),
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
                      width: 100,
                      color: shadeBlue,
                    ),
                    Text(
                      'Hot News',
                      style: TextStyle(
                          fontSize: 28,
                          color: darkBlue,
                          fontWeight: FontWeight.w900),
                    ),
                  ]),
                ),
                // SizedBox(
                //   height: 32,
                // ),
                NewsCarousel(),
              ],
            )));
  }
}


