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

class ListSaveRepository {
  List<Article> _listSaveArticle = [];

  void saveItem(Article article) {
    _listSaveArticle.add(article);
  }

  void deleteItem(Article article) {
    _listSaveArticle.remove(article);
  }

  List<Article> getListSave() {
    return _listSaveArticle;
  }
}

class ListSaveBloc extends Bloc<ListSaveEvent, ListSaveState> {
  ListSaveBloc({ListSaveState initialState}) : super(ListSaveInitial());

  // @override
  // ListSaveState get initialState => ListSaveInitial();

  @override
  Stream<ListSaveState> mapEventToState(ListSaveEvent event) async* {
    ListSaveRepository listSaveRepository = ListSaveRepository();
    switch (event.operation) {
      case Operation.add:
        listSaveRepository.saveItem(event.article);
        yield ListSaveSuccess(listSaveRepository.getListSave());
        break;
      case Operation.delete:
        listSaveRepository.deleteItem(event.article);
        yield ListSaveSuccess(listSaveRepository.getListSave());
        break;
      default:
        yield ListSaveFailed('Unknown operation');
    }
  }
}
