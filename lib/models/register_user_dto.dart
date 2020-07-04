// To parse this JSON data, do
//
//     final registerUserDto = registerUserDtoFromJson(jsonString);

import 'dart:convert';

RegisterUserDto registerUserDtoFromJson(String str) =>
    RegisterUserDto.fromJson(json.decode(str));

String registerUserDtoToJson(RegisterUserDto data) =>
    json.encode(data.toJson());

class RegisterUserDto {
  RegisterUserDto({
    this.password,
    this.firstName,
    this.lastName,
    this.email,
  });

  String password;
  String firstName;
  String lastName;
  String email;

  factory RegisterUserDto.fromJson(Map<String, dynamic> json) =>
      RegisterUserDto(
        password: json["password"] == null ? null : json["password"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        email: json["email"] == null ? null : json["email"],
      );

  Map<String, dynamic> toJson() => {
        "password": password == null ? null : password,
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "email": email == null ? null : email,
      };
}
