import 'package:codeclanmobile/models/register_user_dto.dart';
import 'package:codeclanmobile/services/api/models/track_list_dto.dart';
import 'package:codeclanmobile/services/api/models/track_mentors_dto.dart';
import 'package:codeclanmobile/services/api/models/user_dto.dart';

abstract class IAPIService {
  Future<String> login(email, password);
  Future<bool> register(RegisterUserDto registerUserDto);
  Future<UserDto> getUserProfile();
  Future<TrackListDto> getAllTracks();
  Future<TrackMentorsDto> getTrackMentors(String trackId);
}
