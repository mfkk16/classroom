part of 'registration_bloc.dart';

@immutable
sealed class RegistrationEvent {}

class FetchRegistrations extends RegistrationEvent {}
