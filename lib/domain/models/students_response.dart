import 'dart:convert';

import 'package:classroom/domain/core/entity/students_entity.dart';

StudentsResponse studentsResponseFromJson(String str) =>
    StudentsResponse.fromJson(json.decode(str));

String studentsResponseToJson(StudentsResponse data) =>
    json.encode(data.toJson());

class StudentsResponse {
  List<Student> students;

  StudentsResponse({
    required this.students,
  });

  factory StudentsResponse.fromJson(Map<String, dynamic> json) =>
      StudentsResponse(
        students: List<Student>.from(
            json["students"].map((x) => Student.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "students": List<dynamic>.from(students.map((x) => x.toJson())),
      };
}

class Student extends StudentEntity {
  Student({
    super.id,
    super.age,
    super.email,
    super.name,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        age: json["age"],
        email: json["email"],
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "age": age,
        "email": email,
        "id": id,
        "name": name,
      };
}
