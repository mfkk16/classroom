// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:classroom/domain/core/resource/data_state.dart';
import 'package:meta/meta.dart';

import 'package:classroom/domain/core/entity/classroom_entity.dart';
import 'package:classroom/domain/usecases/get_all_classroom_usecase.dart';

part 'classrooms_event.dart';
part 'classrooms_state.dart';

class ClassroomsBloc extends Bloc<ClassroomsEvent, ClassroomsState> {
  final GetAllClassroomUsecase _getAllClassroomUsecase;

  final List<ClassroomEntity> _listClassrooms = [];

  ClassroomsBloc(this._getAllClassroomUsecase) : super(ClassroomsInitial()) {
    on<FetchAllClassrooms>(fetchAllClassrooms);
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
}
