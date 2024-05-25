// To parse this JSON data, do
//
//     final registrationNewResponse = registrationNewResponseFromJson(jsonString);

import 'dart:convert';

import 'package:classroom/domain/models/registration_response.dart';

RegistrationNewResponse registrationNewResponseFromJson(String str) => RegistrationNewResponse.fromJson(json.decode(str));

String registrationNewResponseToJson(RegistrationNewResponse data) => json.encode(data.toJson());

class RegistrationNewResponse {
  Registration? registration;
  String? error;

  RegistrationNewResponse({
    this.registration,
    this.error,
  });

  factory RegistrationNewResponse.fromJson(Map<String, dynamic> json) => RegistrationNewResponse(
        registration: json["registration"] == null ? null : Registration.fromJson(json["registration"]),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "registration": registration?.toJson(),
        "error": error,
      };
}
