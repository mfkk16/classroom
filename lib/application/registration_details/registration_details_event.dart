// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'registration_details_bloc.dart';

@immutable
sealed class RegistrationDetailsEvent {}

class FetchRegistrationDetails extends RegistrationDetailsEvent {
  final RegistrationEntity registrationEntity;

  FetchRegistrationDetails(this.registrationEntity);
}

class DeleteRegistration extends RegistrationDetailsEvent {
  final int registrationId;
  final BuildContext context;

  DeleteRegistration({
    required this.registrationId,
    required this.context,
  });
}
