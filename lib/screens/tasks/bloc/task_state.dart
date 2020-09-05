part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskError extends TaskState {}

class TaskLoaded extends TaskState {
  final Task task;

  const TaskLoaded({@required this.task});

  @override
  List<Object> get props => [task];
}
