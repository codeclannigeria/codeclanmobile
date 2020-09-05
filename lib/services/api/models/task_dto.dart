// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'dart:convert';

Task taskFromJson(String str) => Task.fromJson(json.decode(str));

String taskToJson(Task data) => json.encode(data.toJson());

class Task {
  Task({
    this.totalCount,
    this.items,
  });

  int totalCount;
  List<Item> items;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
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
    this.id,
    this.updatedAt,
    this.createdAt,
    this.title,
    this.description,
    this.track,
    this.stage,
    this.course,
    this.deadline,
  });

  String id;
  DateTime updatedAt;
  DateTime createdAt;
  String title;
  String description;
  String track;
  String stage;
  String course;
  DateTime deadline;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"] == null ? null : json["id"],
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        track: json["track"] == null ? null : json["track"],
        stage: json["stage"] == null ? null : json["stage"],
        course: json["course"] == null ? null : json["course"],
        deadline:
            json["deadline"] == null ? null : DateTime.parse(json["deadline"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "track": track == null ? null : track,
        "stage": stage == null ? null : stage,
        "course": course == null ? null : course,
        "deadline": deadline == null ? null : deadline.toIso8601String(),
      };
}
