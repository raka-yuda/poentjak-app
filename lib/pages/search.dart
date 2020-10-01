import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/assets/style.dart';
import 'package:test_app/bloc/article_bloc.dart';
import 'package:test_app/models/articles.dart';
import 'package:test_app/widgets/article_widget.dart';

class SearchPage extends StatefulWidget {
  static const String id = 'search';

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Article> listArticle = List<Article>();
  @override
  Widget build(BuildContext context) {
    final ArticleBloc _articleBloc = BlocProvider.of<ArticleBloc>(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 24,
              color: darkBlue,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: Search(listArticle));
                },
                icon: Icon(
                  Icons.search,
                  size: 24,
                  color: darkBlue,
                ))
          ],
          centerTitle: true,
          title: Text(
            'Search Article',
            style: TextStyle(color: darkBlue),
          ),
        ),
        body: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(left: 16, right: 16),
              child: BlocBuilder<ArticleBloc, ArticleState>(
                  bloc: _articleBloc,
                  builder: (context, state) {
                    if (state is ArticleLoading) {
                      return WidgetCircularLoading();
                    } else if (state is ArticleFailure) {
                      return Center(
                        child: Text('${state.errorMessage}'),
                      );
                    } else if (state is ArticleLoaded) {
                      Articles articles = state.articles;
                      return ListView.builder(
                          itemCount: articles.listArticles.length,
                          itemBuilder: (context, index) {
                            Article article = articles.listArticles[index];
                            listArticle.add(article);
                            if (!listArticle[index]
                                    .titleArticle
                                    .contains(article.titleArticle) &&
                                listArticle != []) {
                              listArticle.add(article);
                            }
                            return ListTile(
                              title: Text(article.titleArticle),
                            );
                          });
                    } else {
                      return Container();
                    }
                  }),
            )
          ],
        ));
  }
}

class Search extends SearchDelegate {
  final List<Article> listItem;
  List<Article> recentList = [];
  Article selectedItem;

  Search(this.listItem);

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(
          Icons.close,
          size: 24,
          color: darkBlue,
        ),
        onPressed: () => query = "",
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        size: 24,
        color: darkBlue,
      ),
      onPressed: () => Navigator.pop(context),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.only(left: 12, right: 12, top: 24),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.24,
          child: Expanded(
            child: ArticleTile(selectedItem, false),
          ),
        )
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Article> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList
        : suggestionList.addAll(
            listItem.where((element) => element.titleArticle.contains(query)));
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(suggestionList[index].titleArticle),
            onTap: () {
              selectedItem = suggestionList[index];
              showResults(context);
            },
          );
        });
  }
}
