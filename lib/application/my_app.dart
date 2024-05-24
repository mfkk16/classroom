import 'package:classroom/application/subject/subject_bloc.dart';
import 'package:classroom/dependency_injection.dart';
import 'package:classroom/domain/config/route/routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:classroom/domain/config/route/routes.dart' as routes;
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SubjectBloc>(
            create: (context) => sl()..add(FetchAllSubjects())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: routes.generateRoutes,
        initialRoute: landingPage,
        theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(backgroundColor: Colors.white),
        ),
      ),
    );
  }
}
