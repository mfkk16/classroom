// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:classroom/domain/core/entity/registration_entity.dart';
import 'package:classroom/domain/core/resource/data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:classroom/domain/usecases/get_all_registration_usecase.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final GetAllRegistrationUsecase _getAllRegistrationUsecase;
  final List<RegistrationEntity> _listRegistrations = [];

  RegistrationBloc(
    this._getAllRegistrationUsecase,
  ) : super(RegistrationInitial()) {
    on<FetchRegistrations>(fetchRegistrations);
  }

  FutureOr<void> fetchRegistrations(FetchRegistrations event, Emitter<RegistrationState> emit) async {
    emit(RegLoadingState());
    final res = await _getAllRegistrationUsecase();

    if (res is DataSuccess) {
      _listRegistrations.addAll(res.data!);
      emit(RegLoadedState(listRegistrations: res.data!));
    } else {
      emit(ErrorRegistrationState(error: res.dataError!.errorMessage));
    }
  }
}
