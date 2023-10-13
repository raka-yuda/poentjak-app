import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/repository/api_mountain_repository.dart';
import '../models/mountains.dart';

abstract class MountainState {}

class MountainInitial extends MountainState {}

class MountainLoading extends MountainState {}

class MountainFailure extends MountainState {
  final String errorMessage;

  MountainFailure(this.errorMessage);
}

class MountainLoaded extends MountainState {
  final Mountains mountains;

  MountainLoaded(this.mountains);
}

class MountainEvent {}

class MountainBloc extends Bloc<MountainEvent, MountainState> {
  final ApiMountainRepository apiMountainRepository;

  // MountainBloc(MountainState initialState) : super(initialState);
  MountainBloc({this.apiMountainRepository}) : super(MountainInitial());

  // @override
  // MountainState get initialState => MountainInitial();

  @override
  Stream<MountainState> mapEventToState(MountainEvent event) async* {
    yield MountainLoading();
    Mountains mountains = await apiMountainRepository.fetchMountains();
    if (mountains.error != null) {
      yield MountainFailure(mountains.toString());
      return;
    }
    yield MountainLoaded(mountains);
  }
}
