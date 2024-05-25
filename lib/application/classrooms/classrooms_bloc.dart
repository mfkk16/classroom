// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:classroom/domain/core/entity/subject_entity.dart';
import 'package:classroom/domain/core/resource/data_state.dart';
import 'package:classroom/domain/usecases/get_classroom_by_id.dart';

import 'package:classroom/domain/core/entity/classroom_entity.dart';
import 'package:classroom/domain/usecases/get_all_classroom_usecase.dart';
import 'package:classroom/domain/usecases/get_subject_bt_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'classrooms_event.dart';
part 'classrooms_state.dart';

class ClassroomsBloc extends Bloc<ClassroomsEvent, ClassroomsState> {
  final GetAllClassroomUsecase _getAllClassroomUsecase;
  final GetClassroomByIdUsecase _getClassroomByIdUsecase;
  final GetSubjectBtIdUsecase _getSubjectBtIdUsecase;

  final List<ClassroomEntity> _listClassrooms = [];
  ClassroomEntity? selectedClassroom;
  SubjectEntity? selectedSubject;

  ClassroomsBloc(
    this._getAllClassroomUsecase,
    this._getClassroomByIdUsecase,
    this._getSubjectBtIdUsecase,
  ) : super(ClassroomsInitial()) {
    on<FetchAllClassrooms>(fetchAllClassrooms);
    on<FetchClassroomByIdEvent>(fetchClassroomByIdEvent);
  }

  FutureOr<void> fetchAllClassrooms(
      FetchAllClassrooms event, Emitter<ClassroomsState> emit) async {
    emit(LoadingState());
    final res = await _getAllClassroomUsecase();

    if (res is DataSuccess) {
      _listClassrooms.addAll(res.data!);
      emit(ClassroomsLoadedState(list: res.data!));
    } else {
      emit(ErrorState(error: res.dataError!.errorMessage));
    }
  }

  fetchClassroomByIdEvent(
      FetchClassroomByIdEvent event, Emitter<ClassroomsState> emit) async {
    selectedSubject = null;
    selectedClassroom = null;
    final res = await _getClassroomByIdUsecase(params: event.id);
    selectedClassroom = res.data!;
    if (selectedClassroom!.subject is int) {
      final resSubject =
          await _getSubjectBtIdUsecase(params: selectedClassroom!.subject);
      selectedSubject = resSubject.data!;
    }
  }
}
