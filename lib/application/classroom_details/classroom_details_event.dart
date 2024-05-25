part of 'classroom_details_bloc.dart';

@immutable
sealed class ClassroomDetailsEvent {}

class FetchClassroomByIdEvent extends ClassroomDetailsEvent {
  final int classroomId;
  FetchClassroomByIdEvent({required this.classroomId});
}

class AddSubjectIntoClassroom extends ClassroomDetailsEvent {
  final BuildContext context;

  AddSubjectIntoClassroom({required this.context});
}
