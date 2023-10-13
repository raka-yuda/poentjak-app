import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/repository/api_article_repository.dart';
import '../models/articles.dart';

abstract class ArticleState {}

class ArticleInitial extends ArticleState {}

class ArticleLoading extends ArticleState {}

class ArticleFailure extends ArticleState {
  final String errorMessage;

  ArticleFailure(this.errorMessage);
}

class ArticleLoaded extends ArticleState {
  final Articles articles;

  ArticleLoaded(this.articles);
}

class ArticleEvent {}

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ApiArticleRepository apiArticleRepository;

  ArticleBloc({this.apiArticleRepository}) : super(ArticleInitial());

  // @override
  // ArticleState get initialState => ArticleInitial();

  @override
  Stream<ArticleState> mapEventToState(ArticleEvent event) async* {
    yield ArticleLoading();
    Articles articles = await apiArticleRepository.fetchArticles();
    if (articles.error != null) {
      yield ArticleFailure(articles.toString());
      return;
    }
    yield ArticleLoaded(articles);
  }
}
