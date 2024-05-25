import 'package:classroom/application/classroom_details/classroom_details_bloc.dart';
import 'package:classroom/domain/constants/color_cont.dart';
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
    BlocProvider.of<ClassroomDetailsBloc>(context)
        .add(FetchClassroomByIdEvent(classroomId: classroomEntity.id!));
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
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: BlocBuilder<ClassroomDetailsBloc, ClassroomDetailsState>(
        builder: (context, state) {
          if (state is LoadingSubjectState) {
            return const CircularProgressIndicator();
          } else if (state is ClassroomDetailsLoadedState) {
            return state.classroomEntity.subject is int
                ? ListTile(
                    tileColor: ColorCont.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    title: Text(state.subjectEntity!.name!),
                    subtitle: Text(state.subjectEntity!.teacher!),
                    trailing: ElevatedButton(
                      onPressed: () =>
                          BlocProvider.of<ClassroomDetailsBloc>(context)
                              .add(AddSubjectIntoClassroom(context: context)),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          backgroundColor: ColorCont.greenDark),
                      child: const Text("Change",
                          style: TextStyle(color: ColorCont.greenLight)),
                    ),
                  )
                : ListTile(
                    tileColor: ColorCont.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    title: const Text("Add Subject"),
                    trailing: ElevatedButton(
                      onPressed: () =>
                          BlocProvider.of<ClassroomDetailsBloc>(context)
                              .add(AddSubjectIntoClassroom(context: context)),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          backgroundColor: ColorCont.greenDark),
                      child: const Text("Add",
                          style: TextStyle(color: ColorCont.greenLight)),
                    ),
                  );
          } else if (state is ErrorSubjectState) {
            return Text(state.error);
          }
          return Container();
        },
      ),
    );
  }
}
