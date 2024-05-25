import 'dart:convert';

import 'package:classroom/domain/core/entity/registration_entity.dart';

RegistrationsResponse registrationsResponseFromJson(String str) => RegistrationsResponse.fromJson(json.decode(str));

String registrationsResponseToJson(RegistrationsResponse data) => json.encode(data.toJson());

class RegistrationsResponse {
  List<Registration> registrations;

  RegistrationsResponse({
    required this.registrations,
  });

  factory RegistrationsResponse.fromJson(Map<String, dynamic> json) => RegistrationsResponse(
        registrations: List<Registration>.from(json["registrations"].map((x) => Registration.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "registrations": List<dynamic>.from(registrations.map((x) => x.toJson())),
      };
}

class Registration extends RegistrationEntity {
  Registration({
    super.id,
    super.student,
    super.subject,
  });

  factory Registration.fromJson(Map<String, dynamic> json) => Registration(
        id: json["id"],
        student: json["student"],
        subject: json["subject"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "student": student,
        "subject": subject,
      };
}
