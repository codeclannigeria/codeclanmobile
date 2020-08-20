// To parse this JSON data, do
//
//     final accountVerificationDto = accountVerificationDtoFromJson(jsonString);

import 'dart:convert';

AccountVerificationDto accountVerificationDtoFromJson(String str) =>
    AccountVerificationDto.fromJson(json.decode(str));

String accountVerificationDtoToJson(AccountVerificationDto data) =>
    json.encode(data.toJson());

class AccountVerificationDto {
  AccountVerificationDto({
    this.clientBaseUrl,
    this.tokenParamName,
    this.emailParamName,
    this.email,
  });

  String clientBaseUrl;
  String tokenParamName;
  String emailParamName;
  String email;

  factory AccountVerificationDto.fromJson(Map<String, dynamic> json) =>
      AccountVerificationDto(
        clientBaseUrl:
            json["clientBaseUrl"] == null ? null : json["clientBaseUrl"],
        tokenParamName:
            json["tokenParamName"] == null ? null : json["tokenParamName"],
        emailParamName:
            json["emailParamName"] == null ? null : json["emailParamName"],
        email: json["email"] == null ? null : json["email"],
      );

  Map<String, dynamic> toJson() => {
        "clientBaseUrl": clientBaseUrl == null ? null : clientBaseUrl,
        "tokenParamName": tokenParamName == null ? null : tokenParamName,
        "emailParamName": emailParamName == null ? null : emailParamName,
        "email": email == null ? null : email,
      };
}
