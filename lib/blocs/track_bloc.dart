import 'package:codeclanmobile/repositories/track_repository.dart';
import 'package:codeclanmobile/services/api/models/mentor_input.dart';
import 'package:codeclanmobile/services/api/models/track_list_dto.dart';
import 'package:codeclanmobile/services/api/models/track_mentors_dto.dart';
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

class FetchTrackMentorsLoading extends TracksState {}

class FetchTrackMentorsError extends TracksState {}

class TracksError extends TracksState {}

class TracksLoaded extends TracksState {
  final TrackListDto tracks;

  const TracksLoaded({@required this.tracks});

  @override
  List<Object> get props => [tracks];
}

class FetchTrackMentorsLoaded extends TracksState {
  final TrackMentorsDto tracksMentorsDto;

  const FetchTrackMentorsLoaded({@required this.tracksMentorsDto});

  @override
  List<Object> get props => [tracksMentorsDto];
}

// Enroll To  Track State
class EnrollToTrackSuccess extends TracksState {}

class EnrollToTrackFailure extends TracksState {}

class EnrollToTrackLoading extends TracksState {}

// Define Tracks Event
abstract class TracksEvent extends Equatable {
  const TracksEvent();
  @override
  List<Object> get props => [];
}

class FetchAllTracks extends TracksEvent {}

class FetchTrackMentors extends TracksEvent {
  final String trackId;

  FetchTrackMentors({@required this.trackId});
}

class EnrollToTrack extends TracksEvent {
  final String trackId;
  final MentorInput mentorInput;

  EnrollToTrack({@required this.trackId, @required this.mentorInput});
}

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
    if (event is FetchTrackMentors) {
      yield FetchTrackMentorsLoading();
      try {
        final mentorsList =
            await _trackRepository.getAllTrackMentors(event.trackId);
        yield FetchTrackMentorsLoaded(tracksMentorsDto: mentorsList);
      } catch (e) {
        yield FetchTrackMentorsError();
      }
    }
    if (event is EnrollToTrack) {
      yield EnrollToTrackLoading();
      try {
        await _trackRepository.enrollToTrack(event.mentorInput, event.trackId);
        yield EnrollToTrackSuccess();
      } catch (e) {
        yield EnrollToTrackFailure();
      }
    }
  }
}
