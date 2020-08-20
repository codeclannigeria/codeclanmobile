// To parse this JSON data, do
//
//     final trackMentorsDto = trackMentorsDtoFromJson(jsonString);

import 'dart:convert';

TrackMentorsDto trackMentorsDtoFromJson(String str) =>
    TrackMentorsDto.fromJson(json.decode(str));

String trackMentorsDtoToJson(TrackMentorsDto data) =>
    json.encode(data.toJson());

class TrackMentorsDto {
  TrackMentorsDto({
    this.items,
    this.totalCount,
  });

  List<Item> items;
  int totalCount;

  factory TrackMentorsDto.fromJson(Map<String, dynamic> json) =>
      TrackMentorsDto(
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        totalCount: json["totalCount"] == null ? null : json["totalCount"],
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? null
            : List<dynamic>.from(items.map((x) => x.toJson())),
        "totalCount": totalCount == null ? null : totalCount,
      };
}

class Item {
  Item({
    this.updatedAt,
    this.createdAt,
    this.role,
    this.gender,
    this.dob,
    this.technologies,
    this.photoUrl,
    this.tracks,
    this.firstName,
    this.lastName,
    this.email,
    this.description,
    this.city,
    this.country,
    this.phoneNumber,
    this.id,
  });

  DateTime updatedAt;
  DateTime createdAt;
  String role;
  String gender;
  DateTime dob;
  List<String> technologies;
  String photoUrl;
  List<dynamic> tracks;
  String firstName;
  String lastName;
  String email;
  String description;
  String city;
  String country;
  String phoneNumber;
  String id;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        role: json["role"] == null ? null : json["role"],
        gender: json["gender"] == null ? null : json["gender"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        technologies: json["technologies"] == null
            ? null
            : List<String>.from(json["technologies"].map((x) => x)),
        photoUrl: json["photoUrl"] == null ? null : json["photoUrl"],
        tracks: json["tracks"] == null
            ? null
            : List<dynamic>.from(json["tracks"].map((x) => x)),
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        email: json["email"] == null ? null : json["email"],
        description: json["description"] == null ? null : json["description"],
        city: json["city"] == null ? null : json["city"],
        country: json["country"] == null ? null : json["country"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "role": role == null ? null : role,
        "gender": gender == null ? null : gender,
        "dob": dob == null ? null : dob.toIso8601String(),
        "technologies": technologies == null
            ? null
            : List<dynamic>.from(technologies.map((x) => x)),
        "photoUrl": photoUrl == null ? null : photoUrl,
        "tracks":
            tracks == null ? null : List<dynamic>.from(tracks.map((x) => x)),
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "email": email == null ? null : email,
        "description": description == null ? null : description,
        "city": city == null ? null : city,
        "country": country == null ? null : country,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "id": id == null ? null : id,
      };
}
