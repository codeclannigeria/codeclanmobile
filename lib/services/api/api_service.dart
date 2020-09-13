import 'package:codeclanmobile/models/register_user_dto.dart';
import 'package:codeclanmobile/repositories/interceptor.dart';
import 'package:codeclanmobile/services/api/i_api_service.dart';
import 'package:codeclanmobile/services/api/models/acct_verification_dto.dart';
import 'package:codeclanmobile/services/api/models/api_exception.dart';
import 'package:codeclanmobile/services/api/models/login_res_dto.dart';
import 'package:codeclanmobile/services/api/models/mentor_input.dart';
import 'package:codeclanmobile/services/api/models/stages_dto.dart';
import 'package:codeclanmobile/services/api/models/task_dto.dart';
import 'package:codeclanmobile/services/api/models/track_list_dto.dart';
import 'package:codeclanmobile/services/api/models/track_mentors_dto.dart';
import 'package:codeclanmobile/services/api/models/user_dto.dart';
import 'package:codeclanmobile/utils/globals.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'models/register_res_dto.dart';

class ApiService implements IAPIService {
  Dio _dio;

  ApiService() {
    BaseOptions options = BaseOptions(
        receiveTimeout: 100000,
        connectTimeout: 100000,
        baseUrl: Globals.apiBaseUrl);
    _dio = Dio(options);
    _dio.interceptors.add(ApiInterceptor());
    _dio.interceptors.add(PrettyDioLogger());
  }

  @override
  Future<String> login(email, password) async {
    final url = '/auth/login';
    try {
      Response response = await _dio.post(url,
          data: {
            "email": email,
            "password": password,
          },
          options: Options(headers: {"requireToken": false}));
      LoginResDto result = LoginResDto.fromJson(response.data);
      return result.accessToken;
    } on DioError catch (e) {
      if (e.response != null) {
        ApiException result = ApiException.fromJson(e.response.data);
        throw result.message;
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  @override
  Future<bool> register(RegisterUserDto registerUserDto) async {
    final url = '/auth/register';
    try {
      Response response = await _dio.post(url,
          data: registerUserDto.toJson(),
          options: Options(headers: {"requireToken": false}));
      // RegisterUserResDto result = RegisterUserResDto.fromJson(response.data);
      return true;
    } on DioError catch (e) {
      if (e.response != null) {
        ApiException result = ApiException.fromJson(e.response.data);
        throw result.message;
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  @override
  Future<bool> sendVerificatonEmail(
      AccountVerificationDto accountVerificationDto) async {
    final url = '/auth/send-email-confirmation-token';
    try {
      await _dio.post(url,
          data: accountVerificationDto.toJson(),
          options: Options(headers: {"requireToken": false}));
      // RegisterUserResDto result = RegisterUserResDto.fromJson(response.data);
      return true;
    } on DioError catch (e) {
      if (e.response != null) {
        ApiException result = ApiException.fromJson(e.response.data);
        throw result.message;
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  @override
  Future<UserDto> getUserProfile() async {
    final url = '/profile';
    try {
      Response response = await _dio.get(url);
      UserDto result = UserDto.fromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null) {
        ApiException result = ApiException.fromJson(e.response.data);
        throw result.message;
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  @override
  Future<TrackListDto> getAllTracks() async {
    final url = '/tracks';
    try {
      Response response = await _dio.get(url);
      TrackListDto result = TrackListDto.fromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null) {
        ApiException result = ApiException.fromJson(e.response.data);
        throw result.message;
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  @override
  Future<TrackMentorsDto> getTrackMentors(String trackId) async {
    final url = '/tracks/$trackId/mentors';
    try {
      Response response = await _dio.get(url);
      TrackMentorsDto result = TrackMentorsDto.fromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null) {
        ApiException result = ApiException.fromJson(e.response.data);
        throw result.message;
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  @override
  Future<bool> enrollToTrack(MentorInput input, String trackId) async {
    final url = '/tracks/$trackId/enroll';
    try {
      Response response = await _dio.post(url, data: input.toJson());
      // TrackMentorsDto result = TrackMentorsDto.fromJson(response.data);
      return true;
    } on DioError catch (e) {
      if (e.response != null) {
        ApiException result = ApiException.fromJson(e.response.data);
        throw result.message;
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  @override
  Future<Task> getTasks() async {
    final url = '/tasks';
    try {
      Response response = await _dio.get(url);
      Task result = Task.fromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null) {
        ApiException result = ApiException.fromJson(e.response.data);
        throw result.message;
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  @override
  Future<StagesDto> getTrackStages(String trackId) async {
    final url = '/tracks/$trackId/stages';
    try {
      Response response = await _dio.get(url);
      StagesDto result = StagesDto.fromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null) {
        ApiException result = ApiException.fromJson(e.response.data);
        throw result.message;
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }
}
