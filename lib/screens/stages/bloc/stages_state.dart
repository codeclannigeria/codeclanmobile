part of 'stages_bloc.dart';

abstract class StagesState extends Equatable {
  const StagesState();

  @override
  List<Object> get props => [];
}

class StagesInitial extends StagesState {}

class StagesLoading extends StagesState {}

class StagesError extends StagesState {}

class StagesLoaded extends StagesState {
  final StagesDto stages;

  const StagesLoaded({@required this.stages});
  @override
  List<Object> get props => [stages];
}
