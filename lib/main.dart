import 'package:classroom/domain/config/routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:classroom/domain/config/routes.dart' as routes;

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routes.generateRoutes,
      initialRoute: landingPage,
    ),
  );
}
