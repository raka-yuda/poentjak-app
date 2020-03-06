import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.menu,
            color: darkBlue,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.search,
                color: darkBlue,
              ),
              SizedBox(width: 32),
              Icon(
                Icons.people,
                color: darkBlue,
              )
            ],
          )
        ],
      ),
    );
  }
}

class NewsModel {
  final int id;
  // final String name;
  final String link;
  NewsModel(this.id, this.link);
}

class NewsCarousel extends StatefulWidget {
  NewsCarousel() : super();

  final String title = "Carousel Demo";

  @override
  NewsCarouselState createState() => NewsCarouselState();
}

class NewsCarouselState extends State<NewsCarousel> {
  //
  CarouselSlider carouselSlider;
  int _current = 0;
  List imgList = [
    "https://images.pexels.com/photos/1169754/pexels-photo-1169754.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    "https://images.pexels.com/photos/2538107/pexels-photo-2538107.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    "https://images.pexels.com/photos/912469/pexels-photo-912469.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
  ];

  // final List<NewsModel> _newslist = [
  //   NewsModel(1,
  //       "https://images.pexels.com/photos/1169754/pexels-photo-1169754.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
  //   NewsModel(2,
  //       "https://images.pexels.com/photos/2538107/pexels-photo-2538107.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
  //   NewsModel(3,
  //       "https://images.pexels.com/photos/912469/pexels-photo-912469.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
  // ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      // margin: EdgeInsets.only(top: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          carouselSlider = CarouselSlider(
            height: MediaQuery.of(context).size.height * 0.2,
            initialPage: 0,
            enlargeCenterPage: true,
            autoPlay: true,
            reverse: false,
            enableInfiniteScroll: true,
            autoPlayInterval: Duration(seconds: 2),
            autoPlayAnimationDuration: Duration(milliseconds: 2000),
            pauseAutoPlayOnTouch: Duration(seconds: 10),
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              setState(() {
                _current = index;
              });
            },
            items: imgList.map((url) {
              return Builder(
                builder: (BuildContext context) {
                  return
                      // Container(
                      //   width: MediaQuery.of(context).size.width,
                      //   margin: EdgeInsets.symmetric(horizontal: 10.0),
                      //   child: ClipRRect(
                      //       borderRadius: BorderRadius.circular(10.0),
                      //       child: Image.network(imgUrl, fit: BoxFit.cover)),
                      // );
                      Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Hero(
                        tag: context,
                        child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HeroExamplePage())),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(url, fit: BoxFit.cover)))),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class HeroExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected image'),
      ),
      body: Stack(
        children: <Widget>[
          // Column(
          //   children: <Widget>[
          //     Hero(
          //       tag: context,
          //       child: Container(
          //           height: 250,
          //           width: MediaQuery.of(context).size.width,
          //           child: FittedBox(
          //             child: Image.network(
          //               "https://images.pexels.com/photos/1169754/pexels-photo-1169754.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
          //             ),
          //             fit: BoxFit.fill,
          //           )),
          //     ),
          //     SizedBox(
          //       height: 100,
          //     ),
          //     Text(context.toString())
          //   ],
          // ),
          Positioned(
              top: 200,
              left: 75,
              child: Hero(
                  tag: "tes",
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.blueAccent,
                        // child: Center(
                        //     child: Icon(
                        //   Icons.account_circle,
                        //   size: 50,
                        // )
                        child: FittedBox(
                          child: Image.network(
                            "https://images.pexels.com/photos/1169754/pexels-photo-1169754.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                          ),
                          fit: BoxFit.cover,
                        ),
                      )))),
        ],
      ),
    );
  }
}
