import 'package:classroom/Precentation/Pages/landing_page.dart';
import 'package:classroom/Precentation/Widgets/undefined_view.dart';
import 'package:flutter/material.dart';

import 'routes_constants.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case landingPage:
      return MaterialPageRoute(builder: (context) => const LandingPage());
    default:
      return MaterialPageRoute(
          builder: (context) => UndefinedView(settings.name!));
  }
}
