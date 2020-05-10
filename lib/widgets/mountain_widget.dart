import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/api/api_services.dart';
import 'package:test_app/assets/colors.dart';
import 'package:test_app/models/article.dart';
import 'package:test_app/models/mountain.dart';

import '../models/mount_model.dart';

class CardMount extends StatefulWidget {
  @override
  _CardMountState createState() => _CardMountState();
}

class _CardMountState extends State<CardMount> {
  ApiService apiService;

  void initState() {
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 10, 20),
            child: FutureBuilder<List<Mountain>>(
                future: apiService.getMountains(),
                builder: (context, snapshot) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mountList.length,
                      itemBuilder: (context, index) {
                        if (snapshot.hasData) {
//                          return CardMount(mountList[index]);
                          return CardMountain();
                        }
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.36,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      });
                })),
      ],
    );
  }
}

class CardMountain extends StatelessWidget {
  final Mountain _mountain;

  CardMountain(this._mountain);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "mount_" * _mountain.id,
      child: Stack(
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width * 0.56,
              height: MediaQuery.of(context).size.height * 0.36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                image: DecorationImage(
                  image: NetworkImage(_mountain.imgMt),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              color: shadeBlue.withOpacity(0.84)),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Text(
                                      _mountain.nameMt,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,
                                          decoration: TextDecoration.none),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.5),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Text(
                                      _mountain.location,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white54,
                                          decoration: TextDecoration.none),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.5),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          decoration: TextDecoration.none),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                  Positioned.fill(
                      child: new Material(
                          color: Colors.transparent,
                          child: new InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CardMountDetail(_mountain))),
                          )))
                ],
              ))
        ],
      ),
    );
  }
}

class CardMountDetail extends StatelessWidget {
  final Mountain _mountain;

  CardMountDetail(this._mountain);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
            height: MediaQuery.of(context).size.height * 0.46,
            width: MediaQuery.of(context).size.width,
            child: Hero(
              tag: "mount_" * _mount.id,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.36,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: new BorderRadius.only(
                            bottomRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12)),
                        image: DecorationImage(
                            image: NetworkImage(_mount.link),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.28,
//               left: 20,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.14,
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        padding:
                            EdgeInsets.symmetric(horizontal: 36, vertical: 24),
                        decoration: BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(Radius.circular(12)),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Material(
                                  color: Colors.transparent,
                                  child: Text(
                                    _mount.mtName,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black87,
                                        decoration: TextDecoration.none),
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Material(
                                  color: Colors.transparent,
                                  child: Text(_mount.mtLocation,
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 14,
                                          decoration: TextDecoration.none)),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MapScreen())),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white.withOpacity(0.8),
                                          offset: Offset(-6.0, -6.0),
                                          blurRadius: 16.0,
                                        ),
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          offset: Offset(6.0, 6.0),
                                          blurRadius: 16.0,
                                        ),
                                      ],
                                      color: Color(0xFFEFEEEE),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Center(
                                      child: Icon(Icons.gps_fixed),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
//                 SizedBox(
//                                 height: MediaQuery.of(context).size.height * 0.8,
//                               ),
                ],
              ),
            )),
        Container(
            height: MediaQuery.of(context).size.height * 0.5,
            margin: EdgeInsets.symmetric(horizontal: 24),
            padding: EdgeInsets.symmetric(horizontal: 36, vertical: 24),
            decoration: BoxDecoration(
              borderRadius: new BorderRadius.all(Radius.circular(12)),
              color: Colors.white,
            ),
            child: ListView(
              children: <Widget>[
                ExpansionTile(
                  title: Text("Pos 1"),
                  trailing: Icon(Icons.keyboard_arrow_down),
                  children: <Widget>[
                    Column(
                      children: <Widget>[Text("You've been arrive at pos 1")],
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text("Pos 2"),
                  trailing: Icon(Icons.keyboard_arrow_down),
                  children: <Widget>[
                    Column(
                      children: <Widget>[Text("You've been arrive at pos 2")],
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text("Pos 3"),
                  trailing: Icon(Icons.keyboard_arrow_down),
                  children: <Widget>[
                    Column(
                      children: <Widget>[Text("You've been arrive at pos 3")],
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text("Pos 4"),
                  trailing: Icon(Icons.keyboard_arrow_down),
                  children: <Widget>[
                    Column(
                      children: <Widget>[Text("You've been arrive at pos 4")],
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text("Pos 5"),
                  trailing: Icon(Icons.keyboard_arrow_down),
                  children: <Widget>[
                    Column(
                      children: <Widget>[Text("You've been arrive at pos 5")],
                    )
                  ],
                ),
              ],
            )),
      ],
    ));
  }
}
