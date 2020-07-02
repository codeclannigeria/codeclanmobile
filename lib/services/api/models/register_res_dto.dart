// To parse this JSON data, do
//
//     final registerUserResDto = registerUserResDtoFromJson(jsonString);

import 'dart:convert';

RegisterUserResDto registerUserResDtoFromJson(String str) =>
    RegisterUserResDto.fromJson(json.decode(str));

String registerUserResDtoToJson(RegisterUserResDto data) =>
    json.encode(data.toJson());

class RegisterUserResDto {
  RegisterUserResDto({
    this.canLogin,
  });

  final bool canLogin;

  factory RegisterUserResDto.fromJson(Map<String, dynamic> json) =>
      RegisterUserResDto(
        canLogin: json["canLogin"] == null ? null : json["canLogin"],
      );

  Map<String, dynamic> toJson() => {
        "canLogin": canLogin == null ? null : canLogin,
      };
}
