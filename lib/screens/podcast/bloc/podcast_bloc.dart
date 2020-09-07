import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:codeclanmobile/repositories/podcast_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:podcast_search/podcast_search.dart';

part 'podcast_event.dart';
part 'podcast_state.dart';

class PodcastBloc extends Bloc<PodcastEvent, PodcastState> {
  PodcastBloc() : super(PodcastInitial());

  @override
  Stream<PodcastState> mapEventToState(
    PodcastEvent event,
  ) async* {
    final _podcastRepository = new PodcastRepository();
    //AudioPlayer audioPlayer = AudioPlayer();
    if (event is GetPodcast) {
      yield PodcastLoading();
      try {
        final podcast = await _podcastRepository.getPodcastData();
        yield PodcastLoaded(podcast);
      } catch (e) {
        yield PodcastError();
      }
    }
    // if (event is PlayPodcast) {
    //   yield PodcastPlayLoading();
    //   int result = await audioPlayer.play(event.url);
    //   if (result == 1) {
    //     yield PodcastPlaying();
    //   }
    // }
    // if (event is PausePodcast) {
    //   int result = await audioPlayer.pause();
    //   if (result == 1) {
    //     yield PodcastPaused();
    //   }
    // }
  }
}
