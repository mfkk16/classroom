import 'package:classroom/application/classrooms/classrooms_bloc.dart';
import 'package:classroom/domain/core/entity/classroom_entity.dart';
import 'package:classroom/precentation/pages/class_rooms/widgets/classroom_builder.dart';
import 'package:classroom/precentation/pages/class_rooms/widgets/conference_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassroomDetailsPage extends StatelessWidget {
  final ClassroomEntity classroomEntity;

  const ClassroomDetailsPage({super.key, required this.classroomEntity});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ClassroomsBloc>(context)
        .add(FetchClassroomByIdEvent(id: classroomEntity.id!));
    return Scaffold(
      appBar: AppBar(),
      body: _body(context),
    );
  }

  _body(context) {
    return Column(
      children: [
        Text(classroomEntity.name!,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        _blocBuilder(context),
        Expanded(
            child: classroomEntity.layout == "classroom"
                ? ClassroomBuilder(count: classroomEntity.size!)
                : ConferenceBuilder(count: classroomEntity.size!)),
      ],
    );
  }

  _blocBuilder(context) {
    ClassroomsBloc classroomsBloc =
        BlocProvider.of<ClassroomsBloc>(context, listen: true);

    return classroomsBloc.selectedSubject != null
        ? ListTile(
            title: Text(classroomsBloc.selectedSubject!.name!),
            subtitle: Text(classroomsBloc.selectedSubject!.teacher!),
          )
        : ListTile(
            title: Text("Add Subject"),
          );
  }
}
