import 'package:flutter/material.dart';

class ClassroomsPage extends StatelessWidget {
  const ClassroomsPage({super.key});

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
        const Text("Class Rooms"),
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
