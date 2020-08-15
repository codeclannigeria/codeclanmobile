import 'package:codeclanmobile/services/api/api_service.dart';
import 'package:codeclanmobile/services/api/models/track_list_dto.dart';
import 'package:codeclanmobile/services/service_locator.dart';
import 'package:flutter/material.dart';

class TrackRepository {
  var apiService = serviceLocator<ApiService>();
  Future<TrackListDto> getAllTracks() async {
    final tracks = await apiService.getAllTracks();
    return tracks;
  }
}
