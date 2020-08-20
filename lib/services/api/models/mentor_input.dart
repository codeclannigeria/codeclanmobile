// To parse this JSON data, do
//
//     final mentorInput = mentorInputFromJson(jsonString);

import 'dart:convert';

MentorInput mentorInputFromJson(String str) =>
    MentorInput.fromJson(json.decode(str));

String mentorInputToJson(MentorInput data) => json.encode(data.toJson());

class MentorInput {
  MentorInput({
    this.mentorId,
  });

  String mentorId;

  factory MentorInput.fromJson(Map<String, dynamic> json) => MentorInput(
        mentorId: json["mentorId"] == null ? null : json["mentorId"],
      );

  Map<String, dynamic> toJson() => {
        "mentorId": mentorId == null ? null : mentorId,
      };
}
