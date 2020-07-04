import 'package:codeclanmobile/models/register_user_dto.dart';

abstract class IAPIService {
  Future<String> login(email, password);
  Future<bool> register(RegisterUserDto registerUserDto);
}
