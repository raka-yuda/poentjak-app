import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_app/assets/colors.dart';
import 'package:test_app/models/news_model.dart';
import 'package:test_app/models/article_model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
  // List imgList = [
  //   "https://images.pexels.com/photos/1169754/pexels-photo-1169754.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
  //   "https://images.pexels.com/photos/2538107/pexels-photo-2538107.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
  //   "https://images.pexels.com/photos/912469/pexels-photo-912469.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
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
        height: MediaQuery.of(context).size.height * 0.2,
        // margin: EdgeInsets.only(top: 32),
        child:
            Column(
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
                  items: newslist.map((news) => News(news)).toList(),
                ),
              ],
            ),
            Article());
  }
}

class News extends StatelessWidget {
  final NewsModel _news;

  News(this._news);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        // print(url);
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Hero(
              tag: "news_" * _news.id,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Stack(fit: StackFit.expand, children: <Widget>[
                    Image.network(_news.link, fit: BoxFit.cover),
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
                    ),
                    Align(
                        alignment: Alignment(-0.48, 0.64),
                        child: Material(
                          color: Colors.transparent,
                          child: Text(
                            _news.title,
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.none),
                          ),
                        )),
                    Positioned.fill(
                        child: new Material(
                            color: Colors.transparent,
                            child: new InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewsDetail(_news))),
                            )))
                  ]))),
        );
      },
    );
  }
}

// class Article extends StatelessWidget {
//   final ArticleModel _article;

//   Article(this._article);

//   Future<ArticleModel> getArticle() async {
//     String url = 'http://192.168.5.189:3000/api/blog/';
//     final response =
//         await http.get(url, headers: {"Accept": "application/json"});

//     if (response.statusCode == 200) {
//       return ArticleModel.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to load post');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<ArticleModel>(
//       future: getArticle(), //sets the getQuote method as the expected Future
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           //checks if the response returns valid data
//           return Center(
//             child: Column(
//               children: <Widget>[
//                 Text(snapshot.data.id.toString()), //displays the quote
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 Text(
//                     " - ${snapshot.data.titleArticle}"), //displays the quote's author
//               ],
//             ),
//           );
//         } else if (snapshot.hasError) {
//           //checks if the response throws an error
//           return Text("${snapshot.error}");
//         }
//         return CircularProgressIndicator();
//       },
//     );
//   }
// }

class Article extends StatefulWidget {
  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  Future<List<ArticleModel>> _getArticles() async {
    var data = await http.get("http://192.168.5.189:3000/api/blog/");

    var jsonData = json.decode(data.body);

    List<ArticleModel> articles = [];

    for (var u in jsonData) {
      // User user = User(u["index"], u["about"], u["name"], u["email"], u["picture"]);
      ArticleModel article = ArticleModel(
          id: u["id"],
          titleArticle: u["title_article"],
          article: u["article"],
          imgArticle: u["img_article"],
          postDate: u["post_date"],
          nameAuthor: u["name_author"],
          imgAuthor: u["img_author"]);
      articles.add(article);
    }

    print(articles.length);

    return articles;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getArticles(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print(snapshot.data);
        if (snapshot.data == null) {
          return Container(child: Center(child: Text("Loading...")));
        } else {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(snapshot.data[index].imgArticle),
                ),
                title: Text(snapshot.data[index].nameAuthor),
                subtitle: Text(snapshot.data[index].titleArticle),
                onTap: () {
                  // Navigator.push(context,
                  //   new MaterialPageRoute(builder: (context) => DetailPage(snapshot.data[index]))
                  // );
                },
              );
            },
          );
        }
      },
    );
  }
}

class NewsDetail extends StatelessWidget {
  final NewsModel _news;

  NewsDetail(this._news);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Selected image'),
        // ),
        body: Column(
      children: <Widget>[
        Hero(
            tag: "news_" * _news.id,
            child: Stack(
              children: <Widget>[
                Container(
                    // height: 240,
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width,
                    child: FittedBox(
                      child: Image.network(
                        _news.link,
                      ),
                      fit: BoxFit.fill,
                    )),
                Positioned(
                    top: 200,
                    left: 48,
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        _news.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.none),
                      ),
                    ))
              ],
            )),
        SizedBox(
          height: 32,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 36.0,
                        height: 36.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            _news.imgAuthor,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        _news.author,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Text(
                    _news.postDate,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                _news.article,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
