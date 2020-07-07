// To parse this JSON data, do
//
//     final userDto = userDtoFromJson(jsonString);

import 'dart:convert';

UserDto userDtoFromJson(String str) => UserDto.fromJson(json.decode(str));

String userDtoToJson(UserDto data) => json.encode(data.toJson());

class UserDto {
  UserDto({
    this.updatedAt,
    this.createdAt,
    this.role,
    this.technologies,
    this.photoUrl,
    this.tasks,
    this.firstName,
    this.lastName,
    this.email,
    this.description,
    this.phoneNumber,
    this.id,
  });

  final DateTime updatedAt;
  final DateTime createdAt;
  final String role;
  final List<String> technologies;
  final String photoUrl;
  final List<String> tasks;
  final String firstName;
  final String lastName;
  final String email;
  final String description;
  final String phoneNumber;
  final String id;

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        role: json["role"] == null ? null : json["role"],
        technologies: json["technologies"] == null
            ? null
            : List<String>.from(json["technologies"].map((x) => x)),
        photoUrl: json["photoUrl"] == null ? null : json["photoUrl"],
        tasks: json["tasks"] == null
            ? null
            : List<String>.from(json["tasks"].map((x) => x)),
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        email: json["email"] == null ? null : json["email"],
        description: json["description"] == null ? null : json["description"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "role": role == null ? null : role,
        "technologies": technologies == null
            ? null
            : List<dynamic>.from(technologies.map((x) => x)),
        "photoUrl": photoUrl == null ? null : photoUrl,
        "tasks": tasks == null ? null : List<dynamic>.from(tasks.map((x) => x)),
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "email": email == null ? null : email,
        "description": description == null ? null : description,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "id": id == null ? null : id,
      };
}
