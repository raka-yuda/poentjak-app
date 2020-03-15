import 'package:flutter/material.dart';
import 'package:test_app/assets/colors.dart';
import '../assets/images.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(16),
          //   child: Image.network(
          //     "https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
          //     fit: BoxFit.cover,
          //   ),
          // ),
          Container(
            width: 36.0,
            height: 36.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.network(
                "https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            height: 36,
            width: 128,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36),
              color: Color(0xFFEAE9F3),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.gps_fixed,
                    size: 18,
                  ),
                  Text("Jakarta")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardMount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(fit: StackFit.expand, children: <Widget>[
          Image.network(
              "https://images.pexels.com/photos/1169754/pexels-photo-1169754.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
              fit: BoxFit.cover),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0.0),
                      darkBlue.withOpacity(0.48),
                    ],
                    stops: [
                      0.0,
                      1.0
                    ])),
          ),
          Align(
              alignment: Alignment(-0.6, 0.8),
              child: Text(
                "Title",
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              )),
        ]));
  }
}

class ObjCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 10, 20),
            child: Container(
              width: 320,
              height: 280.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://images.pexels.com/photos/1024359/pexels-photo-1024359.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 160, 20, 20),
                  child: Container(
                      width: double.maxFinite,
//                     height: 50.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                'Cafetaria',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.5),
                              child: Text(
                                'Jl. Kenangan , Ancol - North Jakarta',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black26,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.5),
                              child: Text(
                                '300.0 Miles',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))),
            )),
      ],
    );
  }
}
