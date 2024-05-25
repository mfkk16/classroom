part of 'classrooms_bloc.dart';

@immutable
sealed class ClassroomsEvent {}

class FetchAllClassrooms extends ClassroomsEvent {}

class FetchClassroomByIdEvent extends ClassroomsEvent {
  final int id;
  FetchClassroomByIdEvent({required this.id});
}
