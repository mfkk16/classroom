import 'dart:async';

import 'package:classroom/domain/config/route/routes_constants.dart';
import 'package:classroom/domain/core/entity/classroom_entity.dart';
import 'package:classroom/domain/core/entity/subject_entity.dart';
import 'package:classroom/domain/core/resource/data_state.dart';
import 'package:classroom/domain/models/classroom_update.dart';
import 'package:classroom/domain/usecases/get_classroom_by_id.dart';
import 'package:classroom/domain/usecases/get_subject_bt_id.dart';
import 'package:classroom/domain/usecases/set_classroom_subject.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'classroom_details_event.dart';
part 'classroom_details_state.dart';

class ClassroomDetailsBloc
    extends Bloc<ClassroomDetailsEvent, ClassroomDetailsState> {
  final GetClassroomByIdUsecase _getClassroomByIdUsecase;
  final GetSubjectBtIdUsecase _getSubjectBtIdUsecase;
  final SetClassroomSubjectUsecase _setClassroomSubjectUsecase;
  ClassroomEntity? selectedClassroom;
  SubjectEntity? selectedSubject;

  ClassroomDetailsBloc(
    this._getClassroomByIdUsecase,
    this._getSubjectBtIdUsecase,
    this._setClassroomSubjectUsecase,
  ) : super(ClassroomDetailsInitial()) {
    on<FetchClassroomByIdEvent>(fetchClassroomByIdEvent);
    on<AddSubjectIntoClassroom>(addSubjectIntoClassroom);
  }

  FutureOr<void> fetchClassroomByIdEvent(FetchClassroomByIdEvent event,
      Emitter<ClassroomDetailsState> emit) async {
    emit(LoadingSubjectState());
    selectedSubject = null;
    selectedClassroom = null;
    final res = await _getClassroomByIdUsecase(params: event.classroomId);
    selectedClassroom = res.data!;
    if (selectedClassroom!.subject is int) {
      final resSubject =
          await _getSubjectBtIdUsecase(params: selectedClassroom!.subject);
      selectedSubject = resSubject.data!;
      emit(ClassroomDetailsLoadedState(
          classroomEntity: selectedClassroom!,
          subjectEntity: selectedSubject!));
    } else {
      emit(ClassroomDetailsLoadedState(
          classroomEntity: selectedClassroom!, subjectEntity: null));
    }
  }

  FutureOr<void> addSubjectIntoClassroom(AddSubjectIntoClassroom event,
      Emitter<ClassroomDetailsState> emit) async {
    var res =
        await Navigator.pushNamed(event.context, subjectsPage, arguments: true)
            as SubjectEntity;

    ClassroomUpdate data = ClassroomUpdate(
        subjectId: res.id!, classroomId: selectedClassroom!.id!);

    emit(LoadingSubjectState());

    var resUpdate = await _setClassroomSubjectUsecase(params: data);

    if (resUpdate is DataSuccess) {
      add(FetchClassroomByIdEvent(classroomId: resUpdate.data!.id!));
    } else {
      emit(ClassroomDetailsLoadedState(
          classroomEntity: selectedClassroom!, subjectEntity: null));
    }
  }
}
