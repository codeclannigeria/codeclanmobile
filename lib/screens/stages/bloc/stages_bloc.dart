import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:codeclanmobile/repositories/task_repository.dart';
import 'package:codeclanmobile/services/api/models/stages_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'stages_event.dart';
part 'stages_state.dart';

class StagesBloc extends Bloc<StagesEvent, StagesState> {
  StagesBloc() : super(StagesInitial());

  @override
  Stream<StagesState> mapEventToState(
    StagesEvent event,
  ) async* {
    TaskRepository _taskRepository = new TaskRepository();
    if (event is GetTrackStages) {
      yield StagesLoading();
      try {
        final stages = await _taskRepository.getTrackStages(event.trackId);
        yield StagesLoaded(stages: stages);
      } catch (e) {
        StagesError();
      }
    }
  }
}
