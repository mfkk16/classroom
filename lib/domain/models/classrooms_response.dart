import 'dart:convert';

import 'package:classroom/domain/core/entity/classroom_entity.dart';

ClassroomsResponse classroomsResponseFromJson(String str) =>
    ClassroomsResponse.fromJson(json.decode(str));

String classroomsResponseToJson(ClassroomsResponse data) =>
    json.encode(data.toJson());

class ClassroomsResponse {
  List<Classroom> classrooms;

  ClassroomsResponse({
    required this.classrooms,
  });

  factory ClassroomsResponse.fromJson(Map<String, dynamic> json) =>
      ClassroomsResponse(
        classrooms: List<Classroom>.from(
            json["classrooms"].map((x) => Classroom.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "classrooms": List<dynamic>.from(classrooms.map((x) => x.toJson())),
      };
}

class Classroom extends ClassroomEntity {
  Classroom({
    super.id,
    super.name,
    super.layout,
    super.size,
  });

  factory Classroom.fromJson(Map<String, dynamic> json) => Classroom(
        id: json["id"],
        layout: json["layout"],
        name: json["name"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "layout": layout,
        "name": name,
        "size": size,
      };
}
