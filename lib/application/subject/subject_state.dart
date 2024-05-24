part of 'subject_bloc.dart';

@immutable
sealed class SubjectState {}

class SubjectInitial extends SubjectState {}

class LoadingState extends SubjectState {}

class SubjectsLoadedState extends SubjectState {
  final List<SubjectEntity> list;
  SubjectsLoadedState({required this.list});
}

class ErrorState extends SubjectState {
  final String error;
  ErrorState({required this.error});
}
