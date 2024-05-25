part of 'classroom_details_bloc.dart';

@immutable
sealed class ClassroomDetailsEvent {}

class FetchClassroomByIdEvent extends ClassroomDetailsEvent {
  final int id;
  FetchClassroomByIdEvent({required this.id});
}
