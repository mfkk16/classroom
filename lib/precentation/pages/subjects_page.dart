import 'package:flutter/material.dart';

class SubjectsPage extends StatelessWidget {
  const SubjectsPage({super.key});

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
        const Text("Subjects"),
        Expanded(child: _listBuilder()),
      ],
    );
  }

  Widget _listBuilder() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const Text("data");
      },
    );
  }
}
