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
  final List<Mountain> mountain;

  MountainLoaded(this.mountain);
}

class MountainEvent {}

class MountainBloc extends Bloc<MountainEvent, MountainState> {
  final ApiMountainRepository _apiMountainRepository = ApiMountainRepository();

  @override
  MountainState get initialState => MountainInitial();

  @override
  Stream<MountainState> mapEventToState(MountainEvent event) async* {
    yield MountainLoading();
    List<Mountain> mountain = await _apiMountainRepository.fetchMountains();
    if (mountain[0].error != null) {
      yield MountainFailure(mountain.toString());
      return;
    }
    yield MountainLoaded(mountain);
  }
}
