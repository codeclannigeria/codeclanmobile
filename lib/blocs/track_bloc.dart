import 'package:flutter_bloc/flutter_bloc.dart';

// Define Tracks State
abstract class TracksState {
  const TracksState();
}

class TracksInitial extends TracksState {}

class TracksLoading extends TracksState {}

class TracksLoaded extends TracksState {}

// Define Tracks Event
abstract class TracksEvent {
  const TracksEvent();
}

class FetchAllTracks extends TracksEvent {}

// Define Bloc
class TracksBloc extends Bloc<TracksEvent, TracksState> {
  TracksBloc() : super(TracksInitial());

  @override
  Stream<TracksState> mapEventToState(TracksEvent event) async* {
    if (event is FetchAllTracks) {
      yield TracksLoading();
      try {} catch (e) {}
    }
  }
}
