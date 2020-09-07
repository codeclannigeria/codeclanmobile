part of 'podcast_bloc.dart';

abstract class PodcastEvent extends Equatable {
  const PodcastEvent();

  @override
  List<Object> get props => [];
}

class GetPodcast extends PodcastEvent {}

class PlayPodcast extends PodcastEvent {
  final String url;

  PlayPodcast({@required this.url});
}

class PausePodcast extends PodcastEvent {}
