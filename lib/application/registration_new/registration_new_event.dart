part of 'registration_new_bloc.dart';

@immutable
sealed class RegistrationNewEvent {}

class SelectStudent extends RegistrationNewEvent {
  final BuildContext context;

  SelectStudent({required this.context});
}

class SelectSubject extends RegistrationNewEvent {
  final BuildContext context;

  SelectSubject({required this.context});
}

class Register extends RegistrationNewEvent {
  final BuildContext context;

  Register({required this.context});
}

class Reset extends RegistrationNewEvent {}
