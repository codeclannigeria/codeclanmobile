// To parse this JSON data, do
//
//     final userDto = userDtoFromJson(jsonString);

import 'dart:convert';

UserDto userDtoFromJson(String str) => UserDto.fromJson(json.decode(str));

String userDtoToJson(UserDto data) => json.encode(data.toJson());

class UserDto {
  UserDto({
    this.role,
    this.id,
    this.updatedAt,
    this.createdAt,
    this.firstName,
    this.lastName,
    this.email,
    this.description,
    this.city,
    this.country,
    this.gender,
    this.dob,
    this.phoneNumber,
    this.technologies,
    this.photoUrl,
    this.tracks,
  });

  String role;
  String id;
  DateTime updatedAt;
  DateTime createdAt;
  String firstName;
  String lastName;
  String email;
  dynamic description;
  dynamic city;
  dynamic country;
  String gender;
  dynamic dob;
  dynamic phoneNumber;
  List<dynamic> technologies;
  dynamic photoUrl;
  List<Track> tracks;

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        role: json["role"],
        id: json["id"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        description: json["description"],
        city: json["city"],
        country: json["country"],
        gender: json["gender"],
        dob: json["dob"],
        phoneNumber: json["phoneNumber"],
        technologies: List<dynamic>.from(json["technologies"].map((x) => x)),
        photoUrl: json["photoUrl"],
        tracks: List<Track>.from(json["tracks"].map((x) => Track.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "id": id,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "description": description,
        "city": city,
        "country": country,
        "gender": gender,
        "dob": dob,
        "phoneNumber": phoneNumber,
        "technologies": List<dynamic>.from(technologies.map((x) => x)),
        "photoUrl": photoUrl,
        "tracks": List<dynamic>.from(tracks.map((x) => x.toJson())),
      };
}

class Track {
  Track({
    this.id,
    this.updatedAt,
    this.createdAt,
    this.title,
    this.description,
    this.thumbnailUrl,
  });

  String id;
  DateTime updatedAt;
  DateTime createdAt;
  String title;
  String description;
  dynamic thumbnailUrl;

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        id: json["id"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        title: json["title"],
        description: json["description"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "title": title,
        "description": description,
        "thumbnailUrl": thumbnailUrl,
      };
}
