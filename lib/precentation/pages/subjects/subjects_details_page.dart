import 'package:classroom/domain/constants/assets_const.dart';
import 'package:classroom/domain/core/entity/subject_entity.dart';
import 'package:flutter/material.dart';

class SubjectsDetailsPage extends StatelessWidget {
  final SubjectEntity subjectEntity;

  const SubjectsDetailsPage({super.key, required this.subjectEntity});

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
        const Text("Subject Detail",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        Expanded(
            child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(AssetsConst.subjects,
                      fit: BoxFit.cover, height: 100, width: 100)),
              SizedBox(height: 15),
              Text(subjectEntity.name!, style: TextStyle(fontSize: 18)),
              Text(subjectEntity.teacher!, style: TextStyle(fontSize: 18)),
              Text("Credit : ${subjectEntity.name!}"),
              SizedBox(height: 70),
            ],
          ),
        )),
      ],
    );
  }
}
