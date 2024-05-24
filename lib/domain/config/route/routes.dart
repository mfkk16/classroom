import 'package:classroom/Precentation/Pages/landing_page.dart';
import 'package:classroom/Precentation/Widgets/undefined_view.dart';
import 'package:classroom/domain/config/route/routes_constants.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case landingPage:
      return MaterialPageRoute(builder: (context) => const LandingPage());
    default:
      return MaterialPageRoute(
          builder: (context) => UndefinedView(settings.name!));
  }
}
