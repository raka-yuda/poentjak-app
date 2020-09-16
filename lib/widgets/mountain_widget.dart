import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:test_app/assets/colors.dart';
import 'package:test_app/models/mountains.dart';

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
            width: MediaQuery.of(context).size.width * 0.46,
            height: MediaQuery.of(context).size.height * 0.3,
            margin: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: FractionalOffset.center,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Color(0x00000000),
                    darkBlue.withOpacity(1),
                  ],
                  stops: [
                    0.0,
                    1.0
                  ]),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              image: DecorationImage(
                image: NetworkImage(_mountain.imgMt),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.46,
              height: MediaQuery.of(context).size.height * 0.3,
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: FractionalOffset.center,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Color(0x00000000),
                      darkBlue.withOpacity(1),
                    ],
                    stops: [
                      0.0,
                      1.0
                    ]),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(16),
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
                                child: Expanded(
                                  child: Row(children: [
                                    Image(
                                      image: AssetImage(
                                          'lib/assets/images/gps.png'),
                                      width: 14,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      _mountain.location.split(',')[0],
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white54,
                                          decoration: TextDecoration.none),
                                    ),
                                  ]),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.5),
                              child: Material(
                                color: Colors.transparent,
                                child: Text(
                                  "2125 masl",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      decoration: TextDecoration.none),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
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

class CardMountDetail extends StatefulWidget {
  final Mountain _mountain;

  CardMountDetail(this._mountain);

  @override
  _CardMountDetailState createState() => _CardMountDetailState();
}

class _CardMountDetailState extends State<CardMountDetail> {
  final List<int> listPost = [
    1,
    2,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
            height: MediaQuery.of(context).size.height * 0.46,
            width: MediaQuery.of(context).size.width,
            child: Hero(
              tag: "mount_" * widget._mountain.id,
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
                            image: NetworkImage(widget._mountain.imgMt),
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
                                    widget._mountain.nameMt,
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
                                  child: Text(widget._mountain.location,
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
            decoration: BoxDecoration(
              borderRadius: new BorderRadius.all(Radius.circular(12)),
              color: Colors.white,
            ),
            child: postMountainWidget(listPost: listPost)),
      ],
    ));
  }

  Widget postMountainWidget({List<int> listPost}) {
    bool isExpanded = false;
    if (listPost.length == 1) {
      return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 36, vertical: 24),
          itemCount: listPost.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return GestureDetector(
              onTap: () {
//                if (isExpanded == false) {
//                  setState(() {
//                    isExpanded = true;
//                  });
//                } else {
//                  setState(() {
//                    isExpanded = false;
//                  });
//                }
                print('Post tapped');
              },
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Text('Post ' + listPost[index].toString()),
                      ),
//                  (isExpanded == true)
//                      ? Icon(Icons.keyboard_arrow_up)
//                      : Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 52,
                      ),
                      Expanded(
                        child: Text(
                            'The best-known citizen of the Indian hill town of Darjeeling, '
                            'Tenzing Norkay'
                            'His presence reflects the change that has taken place in his affairs since May 29th of last year,'
                            ' when he and Edmund Hillary stood on the summit of Mount Everest. '),
                      ),
//                  (isExpanded == true)
//                      ? Icon(Icons.keyboard_arrow_up)
//                      : Icon(Icons.keyboard_arrow_down),
                    ],
                  )
                ],
              ),
            );
          });
    } else {
      return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 36, vertical: 24),
          itemCount: listPost.length,
          itemBuilder: (BuildContext ctxt, int index) {
            // First widget of post list
            if (index == listPost.first - 1) {
              return Column(
                children: <Widget>[
                  Row(
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
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(8)),
                                color: Colors.black26),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Text('Post ' + listPost[index].toString()),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 18),
                        height: 106,
                        width: 4,
                        decoration: BoxDecoration(
//                                borderRadius: BorderRadius.vertical(
//                                    top: Radius.circular(8)),
                            color: Colors.black26),
                      ),
                      Expanded(
                        child: Text(
                            'The best-known citizen of the Indian hill town of Darjeeling, '
                            'Tenzing Norkay'
                            'His presence reflects the change that has taken place in his affairs since May 29th of last year,'
                            ' when he and Edmund Hillary stood on the summit of Mount Everest. '),
                      ),
                    ],
                  )
                ],
              );
            }
            // Last widget of post list
            else if (index == listPost.last - 1) {
              return Column(
                children: <Widget>[
                  Row(
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
                  ),
                ],
              );
            }
            // Middle widget of post list
            else {
              return Column(
                children: <Widget>[
                  Row(
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
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(8)),
                                color: Colors.black26),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              );
            }
            return Container();
          });
    }
  }

  Widget expandedPostWidget({bool isExpanded}) {
    if (isExpanded == false) {
      return Row(
        children: <Widget>[
          Container(
            height: 100,
            width: 4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                color: Colors.black26),
          ),
          Flex(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text('This is description for post muntain')],
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
