// To parse this JSON data, do
//
//     final apiException = apiExceptionFromJson(jsonString);

import 'dart:convert';

ApiException apiExceptionFromJson(String str) =>
    ApiException.fromJson(json.decode(str));

String apiExceptionToJson(ApiException data) => json.encode(data.toJson());

class ApiException {
  ApiException({
    this.statusCode,
    this.message,
    this.status,
    this.error,
    this.errors,
    this.timestamp,
    this.path,
    this.stack,
  });

  final int statusCode;
  final String message;
  final String status;
  final String error;
  final Errors errors;
  final String timestamp;
  final String path;
  final String stack;

  factory ApiException.fromJson(Map<String, dynamic> json) => ApiException(
        statusCode: json["statusCode"] == null ? null : json["statusCode"],
        message: json["message"] == null ? null : json["message"],
        status: json["status"] == null ? null : json["status"],
        error: json["error"] == null ? null : json["error"],
        errors: json["errors"] == null ? null : Errors.fromJson(json["errors"]),
        timestamp: json["timestamp"] == null ? null : json["timestamp"],
        path: json["path"] == null ? null : json["path"],
        stack: json["stack"] == null ? null : json["stack"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode == null ? null : statusCode,
        "message": message == null ? null : message,
        "status": status == null ? null : status,
        "error": error == null ? null : error,
        "errors": errors == null ? null : errors.toJson(),
        "timestamp": timestamp == null ? null : timestamp,
        "path": path == null ? null : path,
        "stack": stack == null ? null : stack,
      };
}

class Errors {
  Errors();

  factory Errors.fromJson(Map<String, dynamic> json) => Errors();

  Map<String, dynamic> toJson() => {};
}
