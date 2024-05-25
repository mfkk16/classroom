// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'registration_new_bloc.dart';

@immutable
sealed class RegistrationNewState {}

final class RegistrationNewInitial extends RegistrationNewState {}

class LoadingRegistrationNew extends RegistrationNewState {}

class LoadingRegNew extends RegistrationNewState {}

class UpdateRegNew extends RegistrationNewState {}

class ErrorRegNew extends RegistrationNewState {
  final String error;
  ErrorRegNew({required this.error});
}
