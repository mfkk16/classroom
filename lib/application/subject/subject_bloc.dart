import 'dart:async';

import 'package:classroom/domain/core/entity/subject_entity.dart';
import 'package:classroom/domain/core/resource/data_state.dart';
import 'package:classroom/domain/usecases/get_all_subjects_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'subject_event.dart';
part 'subject_state.dart';

class SubjectBloc extends Bloc<SubjectEvent, SubjectState> {
  final GetAllSubjectsUsecase _getAllSubjectsUsecase;
  List<SubjectEntity> _listSubjects = [];

  SubjectBloc(this._getAllSubjectsUsecase) : super(SubjectInitial()) {
    on<FetchAllSubjects>(_fetchAllSubjects);
  }

  FutureOr<void> _fetchAllSubjects(
      FetchAllSubjects event, Emitter<SubjectState> emit) async {
    emit(LoadingState());
    final res = await _getAllSubjectsUsecase();

    if (res is DataSuccess) {
      _listSubjects.addAll(res.data!);
      emit(SubjectsLoadedState(list: res.data!));
    } else {
      emit(ErrorState(error: res.dataError!.errorMessage));
    }
  }
}
