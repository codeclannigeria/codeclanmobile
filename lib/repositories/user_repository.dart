import 'package:codeclanmobile/services/api/api_service.dart';
import 'package:codeclanmobile/services/service_locator.dart';
import 'package:flutter/material.dart';

class UserRepository {
  var apiService = serviceLocator<ApiService>();
  Future<String> authenticate({
    @required String email,
    @required String password,
  }) async {
    final String token = await apiService.login(email, password);
    return token;
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}
