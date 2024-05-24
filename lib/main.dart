import 'package:classroom/domain/config/route/routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:classroom/domain/config/route/routes.dart' as routes;

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routes.generateRoutes,
      initialRoute: landingPage,
    ),
  );
}
