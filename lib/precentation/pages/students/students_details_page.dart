import 'package:classroom/domain/constants/assets_const.dart';
import 'package:classroom/domain/core/entity/students_entity.dart';
import 'package:flutter/material.dart';

class StudentsDetailsPage extends StatelessWidget {
  final StudentEntity studentEntity;
  const StudentsDetailsPage({super.key, required this.studentEntity});
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
        const Text("Student Detail",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        Expanded(
            child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(AssetsConst.profile,
                      fit: BoxFit.cover, height: 100, width: 100)),
              const SizedBox(height: 15),
              Text(studentEntity.name!, style: const TextStyle(fontSize: 18)),
              Text("Age : ${studentEntity.age!}",
                  style: const TextStyle(fontSize: 18)),
              Text(studentEntity.email!),
              const SizedBox(height: 70),
            ],
          ),
        )),
      ],
    );
  }
}
