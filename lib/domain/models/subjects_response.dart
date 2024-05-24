import 'dart:convert';

import 'package:classroom/domain/core/entity/subject_entity.dart';

SubjectResponse subjectResponseFromJson(String str) =>
    SubjectResponse.fromJson(json.decode(str));

String subjectResponseToJson(SubjectResponse data) =>
    json.encode(data.toJson());

class SubjectResponse {
  List<Subject> subjects;

  SubjectResponse({
    required this.subjects,
  });

  factory SubjectResponse.fromJson(Map<String, dynamic> json) =>
      SubjectResponse(
        subjects: List<Subject>.from(
            json["subjects"].map((x) => Subject.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "subjects": List<dynamic>.from(subjects.map((x) => x.toJson())),
      };
}

class Subject extends SubjectEntity {
   Subject({
    super.credits,
    super.id,
    super.name,
    super.teacher,
  });

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        credits: json["credits"],
        id: json["id"],
        name: json["name"],
        teacher: json["teacher"],
      );

  Map<String, dynamic> toJson() => {
        "credits": credits,
        "id": id,
        "name": name,
        "teacher": teacher,
      };
}
