import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:codeclanmobile/repositories/task_repository.dart';
import 'package:codeclanmobile/services/api/models/task_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial());

  @override
  Stream<TaskState> mapEventToState(
    TaskEvent event,
  ) async* {
    TaskRepository _taskRepository = new TaskRepository();
    if (event is GetTracks) {
      yield TaskLoading();
      try {
        final task = await _taskRepository.getAllTasks();
        yield TaskLoaded(task: task);
      } catch (e) {
        yield TaskError();
      }
    }
  }
}
