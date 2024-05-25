import 'dart:async';

import 'package:classroom/domain/core/entity/classroom_entity.dart';
import 'package:classroom/domain/core/entity/subject_entity.dart';
import 'package:classroom/domain/usecases/get_classroom_by_id.dart';
import 'package:classroom/domain/usecases/get_subject_bt_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'classroom_details_event.dart';
part 'classroom_details_state.dart';

class ClassroomDetailsBloc
    extends Bloc<ClassroomDetailsEvent, ClassroomDetailsState> {
  final GetClassroomByIdUsecase _getClassroomByIdUsecase;
  final GetSubjectBtIdUsecase _getSubjectBtIdUsecase;
  ClassroomEntity? selectedClassroom;
  SubjectEntity? selectedSubject;

  ClassroomDetailsBloc(
    this._getClassroomByIdUsecase,
    this._getSubjectBtIdUsecase,
  ) : super(ClassroomDetailsInitial()) {
    on<FetchClassroomByIdEvent>(fetchClassroomByIdEvent);
  }

  FutureOr<void> fetchClassroomByIdEvent(FetchClassroomByIdEvent event,
      Emitter<ClassroomDetailsState> emit) async {
    emit(LoadingSubjectState());
    selectedSubject = null;
    selectedClassroom = null;
    final res = await _getClassroomByIdUsecase(params: event.id);
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
}
