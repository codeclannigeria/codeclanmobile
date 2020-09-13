part of 'stages_bloc.dart';

abstract class StagesEvent extends Equatable {
  const StagesEvent();

  @override
  List<Object> get props => [];
}

class GetTrackStages extends StagesEvent {
  final String trackId;

  const GetTrackStages({@required this.trackId});
}
