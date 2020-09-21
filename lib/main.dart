import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/article_bloc.dart';
import 'bloc/list_save_bloc.dart';
import 'pages/home.dart';
import 'pages/search.dart';
import 'pages/favorite.dart';

void main() => runApp(Poentjak());

class Poentjak extends StatefulWidget {
  @override
  _PoentjakState createState() => _PoentjakState();
}

class _PoentjakState extends State<Poentjak> {
  final ListSaveBloc _listSaveBloc = ListSaveBloc();
  final ArticleBloc _articleBloc = ArticleBloc();

  @override
  void initState() {
    _articleBloc.add(ArticleEvent());
    // _listSaveBloc.add(ListSaveEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ListSaveBloc>(
            create: (BuildContext context) => _listSaveBloc,
          ),
          BlocProvider<ArticleBloc>(
            create: (BuildContext context) => _articleBloc,
          ),
        ],
        child: MaterialApp(
          title: "Poentjak App",
          theme: ThemeData(
            fontFamily: 'google-font',
          ),
          initialRoute: Home.id,
          routes: {
            Home.id: (context) => Home(),
            SearchPage.id: (context) => SearchPage(),
            FavoritePage.id: (context) => FavoritePage(),
          },
          debugShowCheckedModeBanner: false,
        ));
  }
}
