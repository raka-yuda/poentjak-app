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
              borderRadius: BorderRadius.circular(12),
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
              borderRadius: BorderRadius.circular(12),
              color: Color(0xFFEAE9F3),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.gps_fixed,
                    size: 18,
                  ),
                  Text(
                    "Jakarta",
                    style: TextStyle(fontSize: 18),
                  )
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
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 10, 20),
            child: Stack(
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width * 0.56,
                    height: MediaQuery.of(context).size.height * 0.36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://images.pexels.com/photos/3380999/pexels-photo-3380999.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
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
//                     height: 50.0,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    color: shadeBlue.withOpacity(0.84)),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          'Fuji Mount',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(2.5),
                                        child: Text(
                                          'Japan',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white54,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(2.5),
                                        child: Text(
                                          '300.0 Miles',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
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
                                  onTap: () => null,
                                )))
                      ],
                    ))
              ],
            )),
      ],
    );
  }
}
