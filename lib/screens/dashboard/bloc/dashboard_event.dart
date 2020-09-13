part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class OpenPodcastPlayer extends DashboardEvent {
  final Episode episode;

  OpenPodcastPlayer({@required this.episode});
}

class MinimizePodcastPlayer extends DashboardEvent {}
