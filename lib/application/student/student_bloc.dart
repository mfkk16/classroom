import 'dart:async';

import 'package:classroom/domain/core/entity/students_entity.dart';
import 'package:classroom/domain/core/resource/data_state.dart';
import 'package:classroom/domain/usecases/get_all_students_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  GetAllStudentsUsecase _getAllStudentsUsecase;
  final List<StudentEntity> _listStudents = [];

  StudentBloc(this._getAllStudentsUsecase) : super(StudentInitial()) {
    on<FetchAllStudents>(fetchAllStudents);
  }

  FutureOr<void> fetchAllStudents(
      FetchAllStudents event, Emitter<StudentState> emit) async {
    emit(LoadingState());
    final res = await _getAllStudentsUsecase();

    if (res is DataSuccess) {
      _listStudents.addAll(res.data!);
      emit(StudentsLoadedState(list: res.data!));
    } else {
      emit(ErrorState(error: res.dataError!.errorMessage));
    }
  }
}
