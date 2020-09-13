part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class PodcastPlayerOpened extends DashboardState {
  final Episode episode;

  PodcastPlayerOpened(this.episode);
  @override
  List<Object> get props => [episode];
}

class PodcastPlayerMinimized extends DashboardState {}
