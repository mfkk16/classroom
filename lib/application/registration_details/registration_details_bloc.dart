// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:classroom/domain/core/entity/registration_entity.dart';
import 'package:classroom/domain/core/entity/students_entity.dart';
import 'package:classroom/domain/core/entity/subject_entity.dart';
import 'package:classroom/domain/core/resource/data_state.dart';
import 'package:classroom/domain/usecases/delete_registration_usecase.dart';
import 'package:classroom/domain/usecases/get_student_by_id_usecase.dart';
import 'package:classroom/domain/usecases/get_subject_bt_id.dart';

part 'registration_details_event.dart';
part 'registration_details_state.dart';

class RegistrationDetailsBloc extends Bloc<RegistrationDetailsEvent, RegistrationDetailsState> {
  final GetSubjectByIdUsecase _getSubjectByIdUsecase;
  final GetStudentByIdUsecase _getStudentByIdUsecase;
  final DeleteRegistrationUsecase _deleteRegistrationUsecase;

  RegistrationDetailsBloc(
    this._getSubjectByIdUsecase,
    this._getStudentByIdUsecase,
    this._deleteRegistrationUsecase,
  ) : super(RegistrationDetailsInitial()) {
    on<FetchRegistrationDetails>(registrationDetailsEvent);
    on<DeleteRegistration>(deleteRegistration);
  }

  FutureOr<void> registrationDetailsEvent(FetchRegistrationDetails event, Emitter<RegistrationDetailsState> emit) async {
    emit(LoadingRegDetails());
    var studentEntity = await _getStudentByIdUsecase(params: event.registrationEntity.student);
    var subjectEntity = await _getSubjectByIdUsecase(params: event.registrationEntity.subject);

    if (subjectEntity is DataSuccess && studentEntity is DataSuccess) {
      emit(LoadedRegDetails(studentEntity: studentEntity.data!, subjectEntity: subjectEntity.data!));
    } else {
      emit(ErrorRegistrationState(error: "Somethig went wrong"));
    }
  }

  FutureOr<void> deleteRegistration(DeleteRegistration event, Emitter<RegistrationDetailsState> emit) async {
    var deleteRegistration = await _deleteRegistrationUsecase(params: event.registrationId);

    if (deleteRegistration is DataSuccess) {
      Navigator.pop(event.context, true);
    } else {
      emit(ErrorRegistrationState(error: "Somethig went wrong"));
    }
  }
}
