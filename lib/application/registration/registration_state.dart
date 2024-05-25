part of 'registration_bloc.dart';

@immutable
sealed class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class RegLoadingState extends RegistrationState {}

class RegLoadedState extends RegistrationState {
  final List<RegistrationEntity> listRegistrations;

  RegLoadedState({required this.listRegistrations});
}

class ErrorRegistrationState extends RegistrationState {
  final String error;
  ErrorRegistrationState({required this.error});
}
