import 'package:codeclanmobile/services/api/api_service.dart';
import 'package:codeclanmobile/services/api/models/track_list_dto.dart';
import 'package:codeclanmobile/services/api/models/track_mentors_dto.dart';
import 'package:codeclanmobile/services/service_locator.dart';

class TrackRepository {
  var apiService = serviceLocator<ApiService>();
  Future<TrackListDto> getAllTracks() async {
    final tracks = await apiService.getAllTracks();
    return tracks;
  }

  Future<TrackMentorsDto> getAllTrackMentors(String trackId) async {
    final mentorRes = await apiService.getTrackMentors(trackId);
    return mentorRes;
  }
}
