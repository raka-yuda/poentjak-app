import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/models/articles.dart';

enum Operation { add, delete }

abstract class ListSaveState {}

class ListSaveInitial extends ListSaveState {}

class ListSaveSuccess extends ListSaveState {
  final List<Article> listSaveArticle;

  ListSaveSuccess(this.listSaveArticle);
}

class ListSaveFailed extends ListSaveState {
  final String error;

  ListSaveFailed(this.error);
}

class ListSaveEvent {
  final Operation operation;
  final Article article;

  ListSaveEvent(this.operation, this.article);
}

class ListSaveBloc extends Bloc<ListSaveEvent, ListSaveState> {
  @override
  ListSaveState get initialState => ListSaveInitial();

  @override
  Stream<ListSaveState> mapEventToState(ListSaveEvent event) async* {
    List<Article> listSaveArticle = [];
    switch (event.operation) {
      case Operation.add:
        listSaveArticle.add(event.article);
        yield ListSaveSuccess(listSaveArticle);
        break;
      case Operation.delete:
        listSaveArticle.remove(event.article);
        yield ListSaveSuccess(listSaveArticle);
        break;
      default:
        yield ListSaveFailed('Unknown operation');
    }
  }
}
