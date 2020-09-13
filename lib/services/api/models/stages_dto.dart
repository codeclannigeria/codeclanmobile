// To parse this JSON data, do
//
//     final stagesDto = stagesDtoFromJson(jsonString);

import 'dart:convert';

StagesDto stagesDtoFromJson(String str) => StagesDto.fromJson(json.decode(str));

String stagesDtoToJson(StagesDto data) => json.encode(data.toJson());

class StagesDto {
  StagesDto({
    this.totalCount,
    this.items,
  });

  int totalCount;
  List<Item> items;

  factory StagesDto.fromJson(Map<String, dynamic> json) => StagesDto(
        totalCount: json["totalCount"] == null ? null : json["totalCount"],
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalCount": totalCount == null ? null : totalCount,
        "items": items == null
            ? null
            : List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.taskCount,
    this.id,
    this.updatedAt,
    this.createdAt,
    this.title,
    this.description,
    this.level,
    this.track,
  });

  int taskCount;
  String id;
  DateTime updatedAt;
  DateTime createdAt;
  String title;
  String description;
  int level;
  Track track;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        taskCount: json["taskCount"] == null ? null : json["taskCount"],
        id: json["id"] == null ? null : json["id"],
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        level: json["level"] == null ? null : json["level"],
        track: json["track"] == null ? null : Track.fromJson(json["track"]),
      );

  Map<String, dynamic> toJson() => {
        "taskCount": taskCount == null ? null : taskCount,
        "id": id == null ? null : id,
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "level": level == null ? null : level,
        "track": track == null ? null : track.toJson(),
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
        id: json["id"] == null ? null : json["id"],
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "thumbnailUrl": thumbnailUrl,
      };
}
