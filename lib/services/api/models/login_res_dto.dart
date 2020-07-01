// To parse this JSON data, do
//
//     final loginResDto = loginResDtoFromJson(jsonString);

import 'dart:convert';

LoginResDto loginResDtoFromJson(String str) =>
    LoginResDto.fromJson(json.decode(str));

String loginResDtoToJson(LoginResDto data) => json.encode(data.toJson());

class LoginResDto {
  LoginResDto({
    this.accessToken,
  });

  final String accessToken;

  factory LoginResDto.fromJson(Map<String, dynamic> json) => LoginResDto(
        accessToken: json["accessToken"] == null ? null : json["accessToken"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken == null ? null : accessToken,
      };
}
