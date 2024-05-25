// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:classroom/domain/config/route/routes_constants.dart';
import 'package:classroom/domain/core/entity/students_entity.dart';
import 'package:classroom/domain/core/entity/subject_entity.dart';
import 'package:classroom/domain/core/resource/data_state.dart';
import 'package:classroom/domain/models/registration_update.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:classroom/domain/usecases/new_registration_usecase.dart';

part 'registration_new_event.dart';
part 'registration_new_state.dart';

class RegistrationNewBloc extends Bloc<RegistrationNewEvent, RegistrationNewState> {
  final NewRegistrationUsecase _newRegistrationUsecase;

  StudentEntity? studentEntity;
  SubjectEntity? subjectEntity;

  RegistrationNewBloc(
    this._newRegistrationUsecase,
  ) : super(RegistrationNewInitial()) {
    on<SelectStudent>(selectStudent);
    on<SelectSubject>(selectSubject);
    on<Register>(register);
    on<Reset>(reset);
  }

  FutureOr<void> register(Register event, Emitter<RegistrationNewState> emit) async {
    if (studentEntity == null || subjectEntity == null) {
      emit(ErrorRegNew(error: "Student or Subject is missing"));
      return;
    }

    var res = await _newRegistrationUsecase(params: RegistrationUpdate(studentId: studentEntity!.id!, subjectId: subjectEntity!.id!));
    if (res is DataSuccess && res.data == true) {
      Navigator.pop(event.context, true);
    } else {
      emit(ErrorRegNew(error: res.dataError!.errorMessage));
    }
  }

  FutureOr<void> selectSubject(SelectSubject event, Emitter<RegistrationNewState> emit) async {
    var res = await Navigator.pushNamed(event.context, subjectsPage, arguments: true) as SubjectEntity;
    subjectEntity = res;
    emit(UpdateRegNew());
  }

  FutureOr<void> selectStudent(SelectStudent event, Emitter<RegistrationNewState> emit) async {
    var res = await Navigator.pushNamed(event.context, studentsPage, arguments: true) as StudentEntity;
    studentEntity = res;
    emit(UpdateRegNew());
  }

  FutureOr<void> reset(Reset event, Emitter<RegistrationNewState> emit) {
    studentEntity = null;
    subjectEntity = null;
    emit(UpdateRegNew());
  }
}
