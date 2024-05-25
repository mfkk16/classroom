import 'package:classroom/Precentation/Pages/landing_page.dart';
import 'package:classroom/Precentation/Widgets/undefined_view.dart';
import 'package:classroom/domain/config/route/routes_constants.dart';
import 'package:classroom/domain/core/entity/classroom_entity.dart';
import 'package:classroom/domain/core/entity/students_entity.dart';
import 'package:classroom/domain/core/entity/subject_entity.dart';
import 'package:classroom/precentation/pages/class_rooms/classroom_details_page.dart';
import 'package:classroom/precentation/pages/class_rooms/classrooms_page.dart';
import 'package:classroom/precentation/pages/registrations/registrations_page.dart';
import 'package:classroom/precentation/pages/students/students_details_page.dart';
import 'package:classroom/precentation/pages/students/students_page.dart';
import 'package:classroom/precentation/pages/subjects/subjects_details_page.dart';
import 'package:classroom/precentation/pages/subjects/subjects_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case landingPage:
      return MaterialPageRoute(builder: (context) => const LandingPage());
    case studentsPage:
      return MaterialPageRoute(builder: (context) => const StudentsPage());
    case subjectsPage:
      return MaterialPageRoute(
          builder: (context) =>
              SubjectsPage(isSelection: settings.arguments as bool));
    case classroomsPage:
      return MaterialPageRoute(builder: (context) => const ClassroomsPage());
    case registrationsPage:
      return MaterialPageRoute(builder: (context) => const RegistrationsPage());

    case subjectDetailsPage:
      return MaterialPageRoute(
          builder: (context) => SubjectsDetailsPage(
              subjectEntity: settings.arguments as SubjectEntity));
    case studentsDetailsPage:
      return MaterialPageRoute(
          builder: (context) => StudentsDetailsPage(
              studentEntity: settings.arguments as StudentEntity));
    case classroomDetailsPage:
      return MaterialPageRoute(
          builder: (context) => ClassroomDetailsPage(
              classroomEntity: settings.arguments as ClassroomEntity));

    default:
      return MaterialPageRoute(
          builder: (context) => UndefinedView(settings.name!));
  }
}
