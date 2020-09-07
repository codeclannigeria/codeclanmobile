part of 'podcast_bloc.dart';

abstract class PodcastState extends Equatable {
  const PodcastState();

  @override
  List<Object> get props => [];
}

class PodcastInitial extends PodcastState {}

class PodcastLoading extends PodcastState {}

class PodcastError extends PodcastState {}

class PodcastLoaded extends PodcastState {
  final Podcast podcast;

  const PodcastLoaded(this.podcast);

  @override
  List<Object> get props => [podcast];
}

class PodcastPlayLoading extends PodcastState {}

class PodcastPlaying extends PodcastState {}

class PodcastPaused extends PodcastState {}

class PodcastPlayError extends PodcastState {}
