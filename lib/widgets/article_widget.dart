import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:test_app/api/api_services.dart';
import 'package:test_app/assets/colors.dart';
import 'package:test_app/models/article.dart';

//Remove all html tags for displaying preview article

class ArticleCarousel extends StatefulWidget {
  ArticleCarousel() : super();

  final String title = "Carousel Demo";

  @override
  ArticleCarouselState createState() => ArticleCarouselState();
}

class ArticleCarouselState extends State<ArticleCarousel> {
  CarouselSlider carouselSlider;
  //  int _current = 0;
  ApiService apiService;

  void initState() {
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      // margin: EdgeInsets.only(top: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FutureBuilder<List<Article>>(
              future: apiService.getArticles(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return carouselSlider = CarouselSlider(
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
//                    onPageChanged: (index) {
//                      setState(() {
//                        _current = index;
//                      });
//                    },
                    items: snapshot.data
                        .map((article) => ArticleWidget(article))
                        .toList(),
                  );
                }
                return Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }),
        ],
      ),
      // Article()
    );
  }
}

class ArticleWidget extends StatelessWidget {
  final Article _article;

  ArticleWidget(this._article);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        // print(url);
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Hero(
              tag: "article_" * _article.id,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Stack(fit: StackFit.expand, children: <Widget>[
                    Image.network(_article.imgArticle, fit: BoxFit.cover),
                    Container(
                      decoration: BoxDecoration(
                          // color: Colors.white,
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
                          ])),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(bottom: 24, left: 24),
                                child: Material(
                      color: Colors.transparent,
                      child: Text(
                        _article.titleArticle,
                        style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.none),
                      ),
                    ),
                              ),
                            ],
                          ),
                    ),
                    Positioned.fill(
                        child: new Material(
                            color: Colors.transparent,
                            child: new InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ArticleWidgetDetail(_article))),
                            )))
                  ]))),
        );
      },
    );
  }
}

class ArticleWidgetDetail extends StatefulWidget {
  final Article _article;

  ArticleWidgetDetail(this._article);

  @override
  _ArticleWidgetDetailState createState() => _ArticleWidgetDetailState();
}

class _ArticleWidgetDetailState extends State<ArticleWidgetDetail> {
  double progress = 0;

//  WebViewController _controller;

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Selected image'),
        // ),
        body: Column(
      children: <Widget>[
        Hero(
            tag: "article_" * widget._article.id,
            child: Stack(
              children: <Widget>[
                Container(
                    // height: 240,
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width,
                    child: FittedBox(
                      child: Image.network(
                        widget._article.imgArticle,
                      ),
                      fit: BoxFit.cover,
                    )),
                Positioned(
                    top: 200,
                    left: 48,
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        widget._article.titleArticle,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.none),
                      ),
                    ))
              ],
            )),
        // SizedBox(
        //   height: 32,
        // ),
//        Expanded(
//          child: WebView(
//            initialUrl: 'http://192.168.100.6:8081/articles/' +
//                widget._article.id.toString(),
//            javascriptMode: JavascriptMode.unrestricted,
//            // gestureRecognizers: Set()
//            //   ..add(
//            //     Factory<VerticalDragGestureRecognizer>(
//            //       () => VerticalDragGestureRecognizer(),
//            //     ),
//            //     // or null
//            //   ),
//          ),
//        ),
        drawerContent(removeAllHtmlTags(widget._article.article)),
//        Text(removeAllHtmlTags(widget._article.article))
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 32),
        //   child: Column(
        //     children: <Widget>[
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: <Widget>[
        //           Row(
        //             children: <Widget>[
        //               Container(
        //                 width: 36.0,
        //                 height: 36.0,
        //                 child: ClipRRect(
        //                   borderRadius: BorderRadius.circular(12),
        //                   child: Image.network(
        //                     _article.author.imgAuthor,
        //                     fit: BoxFit.cover,
        //                   ),
        //                 ),
        //               ),
        //               SizedBox(
        //                 width: 16,
        //               ),
        //               Text(
        //                 _article.author.nameAuthor,
        //                 style: TextStyle(
        //                     fontSize: 16, fontWeight: FontWeight.w500),
        //               ),
        //             ],
        //           ),
        //           Text(
        //             _article.postDate,
        //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        //           )
        //         ],
        //       ),
        //       SizedBox(
        //         height: 24,
        //       ),
        //       Text(
        //         _article.article,
        //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    ));
  }

  drawerContent(String article) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      height: MediaQuery.of(context).size.height * 0.5,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Text(
          article.length > 100 ? '${article.substring(0, 100)}...' : article),
    );
  }
}
