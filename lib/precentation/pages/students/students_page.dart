import 'package:classroom/application/subject/subject_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentsPage extends StatelessWidget {
  const StudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _body(),
    );
  }

  _body() {
    return Column(
      children: [
        const Text("Students"),
        Expanded(child: _listBuilder()),
      ],
    );
  }

  Widget _listBuilder() {
    return Container();
  }
}
