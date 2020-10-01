import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/list_save_bloc.dart';
import 'package:test_app/models/articles.dart';
import 'package:test_app/widgets/article_widget.dart';
import 'home.dart';

class SavePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ListSaveBloc _listSaveBloc = BlocProvider.of<ListSaveBloc>(context);
    return ListView(
      children: [
        TitleSection(
          title: "Save Item",
          lengthBg: 100,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 16, right: 16),
          child: BlocBuilder<ListSaveBloc, ListSaveState>(
            bloc: _listSaveBloc,
            builder: (context, state) {
              // if (state is ListSaveInitial) {
              //   return Text('Result: -');
              // } else
              if (state is ListSaveFailed) {
                return Text('Waiting ....');
              } else if (state is ListSaveSuccess) {
                // print(state.listSaveArticle);
                List<Article> listSaveArticle = state.listSaveArticle;
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: listSaveArticle.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      print(listSaveArticle.length);
                      Article article = listSaveArticle[index];
                      return Container(
                          height: MediaQuery.of(context).size.height * 0.18,
                          child:
                              // Text(listSaveArticle.length.toString())
                              ArticleTile(article, true));
                    },
                  ),
                );
              } else {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 48),
                      child: Text('You have nothing in here '),
                    ),
                  ],
                );
              }
            },
          ),
        )
      ],
    );
  }
}
