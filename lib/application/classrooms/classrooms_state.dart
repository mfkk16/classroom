part of 'classrooms_bloc.dart';

@immutable
sealed class ClassroomsState {}

class ClassroomsInitial extends ClassroomsState {}

class LoadingState extends ClassroomsState {}

class ClassroomsLoadedState extends ClassroomsState {
  final List<ClassroomEntity> list;
  ClassroomsLoadedState({required this.list});
}

class ErrorState extends ClassroomsState {
  final String error;
  ErrorState({required this.error});
}
