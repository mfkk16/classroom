part of 'registration_details_bloc.dart';

@immutable
sealed class RegistrationDetailsState {}

final class RegistrationDetailsInitial extends RegistrationDetailsState {}

final class LoadingRegDetails extends RegistrationDetailsState {}

final class LoadedRegDetails extends RegistrationDetailsState {
  final StudentEntity studentEntity;
  final SubjectEntity subjectEntity;

  LoadedRegDetails({required this.studentEntity, required this.subjectEntity});
}

class ErrorRegistrationState extends RegistrationDetailsState {
  final String error;
  ErrorRegistrationState({required this.error});
}
