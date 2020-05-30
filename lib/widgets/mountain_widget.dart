import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:test_app/api/api_services.dart';
import 'package:test_app/assets/colors.dart';
import 'package:test_app/models/mountain.dart';

class ListMount extends StatefulWidget {
  @override
  _ListMountState createState() => _ListMountState();
}

class _ListMountState extends State<ListMount> {
  ApiService apiService;

  void initState() {
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 280.0,
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 10, 20),
            child: FutureBuilder<List<Mountain>>(
                future: apiService.getMountains(),
                builder: (context, snapshot) {
                  return (snapshot.hasData)
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            Mountain mountain = snapshot.data[index];
                            return CardMountain(mountain);
                          })
                      : Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                })));
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
              margin: EdgeInsets.symmetric(horizontal: 8),
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
  final List<int> listPost = [1, 2, 3, 4];

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
              tag: "mount_" * _mountain.id,
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
                            image: NetworkImage(_mountain.imgMt),
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
                                    _mountain.nameMt,
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
                                  child: Text(_mountain.location,
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
                                  onTap: () => {},
//                                      Navigator.push(
//                                      context,
//                                      MaterialPageRoute(
//                                          builder: (context) => MapScreen())),
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
            child: postMountainWidget(listPost: listPost)),
      ],
    ));
  }

  Widget postMountainWidget({List<int> listPost}) {
    if (listPost.length == 1) {
      return ListView.builder(
          itemCount: listPost.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return GestureDetector(
              onTap: () {
                expandedPostWidget();
              },
              child: Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        child: Center(
                          child: Text(listPost[index].toString()),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          });
    } else {
      return ListView.builder(
          itemCount: listPost.length,
          itemBuilder: (BuildContext ctxt, int index) {
            if (index == listPost.first - 1) {
              return Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        child: Center(
                          child: Text(listPost[index].toString()),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        height: 10,
                        width: 4,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(8)),
                            color: Colors.black26),
                      )
                    ],
                  ),
                ],
              );
            } else if (index == listPost.last - 1) {
              return Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 10,
                        width: 4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(8)),
                            color: Colors.black26),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      CircleAvatar(
                        child: Center(
                          child: Text(listPost[index].toString()),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else {
              return Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 10,
                        width: 4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(8)),
                            color: Colors.black26),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      CircleAvatar(
                        child: Center(
                          child: Text(listPost[index].toString()),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        height: 10,
                        width: 4,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(8)),
                            color: Colors.black26),
                      )
                    ],
                  ),
                ],
              );
            }
            return Container();
          });
    }
  }

  expandedPostWidget() {
    return Row(
      children: <Widget>[
        Flex(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 100,
              width: 4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                  color: Colors.black26),
            )
          ],
        ),
        Flex(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text('This is description for post muntain')],
        ),
      ],
    );
  }
}
