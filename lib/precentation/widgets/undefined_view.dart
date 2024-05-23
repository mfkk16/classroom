import 'package:flutter/material.dart';

class UndefinedView extends StatelessWidget {
  final String routeName;

  const UndefinedView(this.routeName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("$routeName is not available"),
      ),
    );
  }
}
