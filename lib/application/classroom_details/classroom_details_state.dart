part of 'classroom_details_bloc.dart';

@immutable
sealed class ClassroomDetailsState {}

final class ClassroomDetailsInitial extends ClassroomDetailsState {}

class LoadingSubjectState extends ClassroomDetailsState {}

class ClassroomDetailsLoadedState extends ClassroomDetailsState {
  final SubjectEntity? subjectEntity;
  final ClassroomEntity classroomEntity;
  ClassroomDetailsLoadedState(
      {required this.classroomEntity, required this.subjectEntity});
}

class ErrorSubjectState extends ClassroomDetailsState {
  final String error;
  ErrorSubjectState({required this.error});
}
