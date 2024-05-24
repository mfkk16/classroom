import 'package:classroom/Precentation/Pages/landing_page.dart';
import 'package:classroom/Precentation/Widgets/undefined_view.dart';
import 'package:classroom/domain/config/route/routes_constants.dart';
import 'package:classroom/precentation/pages/classrooms_page.dart';
import 'package:classroom/precentation/pages/registrations_page.dart';
import 'package:classroom/precentation/pages/students_page.dart';
import 'package:classroom/precentation/pages/subjects_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case landingPage:
      return MaterialPageRoute(builder: (context) => const LandingPage());
    case studentsPage:
      return MaterialPageRoute(builder: (context) => const StudentsPage());
    case subjectsPage:
      return MaterialPageRoute(builder: (context) => const SubjectsPage());
    case classroomsPage:
      return MaterialPageRoute(builder: (context) => const ClassroomsPage());
    case registrationsPage:
      return MaterialPageRoute(builder: (context) => const RegistrationsPage());
    default:
      return MaterialPageRoute(
          builder: (context) => UndefinedView(settings.name!));
  }
}
