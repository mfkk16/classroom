part of 'student_bloc.dart';

@immutable
sealed class StudentState {}

class StudentInitial extends StudentState {}

class LoadingState extends StudentState {}

class StudentsLoadedState extends StudentState {
  final List<StudentEntity> list;
  StudentsLoadedState({required this.list});
}

class ErrorState extends StudentState {
  final String error;
  ErrorState({required this.error});
}
