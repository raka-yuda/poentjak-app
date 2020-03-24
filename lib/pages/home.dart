import 'package:flutter/material.dart';
import 'package:test_app/widgets/main_widget.dart';
import 'package:test_app/widgets/news_carousel.dart';
import '../assets/colors.dart';
import '../models/mount_model.dart';

class Home extends StatelessWidget {
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
            body: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                // Padding(
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                //   child: Stack(children: <Widget>[
                //     Container(
                //       margin: EdgeInsets.only(top: 18, left: 4),
                //       height: 10,
                //       width: 132,
                //       color: shadeBlue,
                //     ),
                //     Text(
                //       'Unique Facts',
                //       style: TextStyle(
                //           fontSize: 28,
                //           color: darkBlue,
                //           fontWeight: FontWeight.w900),
                //     ),
                //   ]),
                // ),
                // // SizedBox(
                // //   height: 32,
                // // ),
                NewsCarousel(),
                // Padding(
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                //   child: Stack(children: <Widget>[
                //     Container(
                //       margin: EdgeInsets.only(top: 18, left: 4),
                //       height: 10,
                //       width: 132,
                //       color: shadeBlue,
                //     ),
                //     Text(
                //       'Arround You',
                //       style: TextStyle(
                //           fontSize: 28,
                //           color: darkBlue,
                //           fontWeight: FontWeight.w900),
                //     ),
                //   ]),
                // ),
                // Container(
                //     // margin: EdgeInsets.symmetric(vertical: 20.0),
                //     height: 320.0,
                //     alignment: Alignment.center,
                //     child: ListView.builder(
                //         scrollDirection: Axis.horizontal,
                //         itemCount: mountList.length,
                //         itemBuilder: (context, index) {
                //           return CardMount(mountList[index]);
                //         })),
                Text("Test"),
                // Center(
                //   child: FutureBuilder<ArticleModel>(
                //     future:
                //         getArticle(), //sets the getQuote method as the expected Future
                //     builder: (context, snapshot) {
                //       if (snapshot.hasData) {
                //         //checks if the response returns valid data
                //         return Center(
                //           child: Column(
                //             children: <Widget>[
                //               Text(snapshot.data.id.toString()), //displays the quote
                //               SizedBox(
                //                 height: 10.0,
                //               ),
                //               Text(
                //                   " - ${snapshot.data.titleArticle}"), //displays the quote's author
                //             ],
                //           ),
                //         );
                //       } else if (snapshot.hasError) {
                //         //checks if the response throws an error
                //         return Text("${snapshot.error}");
                //       }
                //       return CircularProgressIndicator();
                //     },
                //   ),
                // ),
              ],
            ))
        //     Scaffold(
        //   body: Center(
        //     child: CardMount(),
        //   ),
        // )

        // HeroTest()
        );
  }
}
