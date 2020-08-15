import 'package:codeclanmobile/repositories/track_repository.dart';
import 'package:codeclanmobile/services/api/models/track_list_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Define Tracks State
abstract class TracksState extends Equatable {
  const TracksState();

  @override
  List<Object> get props => [];
}

class TracksInitial extends TracksState {}

class TracksLoading extends TracksState {}

class TracksError extends TracksState {}

class TracksLoaded extends TracksState {
  final TrackListDto tracks;

  const TracksLoaded({@required this.tracks});

  @override
  List<Object> get props => [tracks];
}

// Define Tracks Event
abstract class TracksEvent extends Equatable {
  const TracksEvent();
  @override
  List<Object> get props => [];
}

class FetchAllTracks extends TracksEvent {}

// Define Bloc
class TracksBloc extends Bloc<TracksEvent, TracksState> {
  TracksBloc() : super(TracksInitial());

  @override
  Stream<TracksState> mapEventToState(TracksEvent event) async* {
    TrackRepository _trackRepository = new TrackRepository();
    if (event is FetchAllTracks) {
      yield TracksLoading();
      try {
        final tracks = await _trackRepository.getAllTracks();
        yield TracksLoaded(tracks: tracks);
      } catch (e) {
        yield TracksError();
      }
    }
  }
}
