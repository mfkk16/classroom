import 'dart:convert';

import 'package:classroom/domain/constants/app_cons.dart';
import 'package:classroom/domain/core/entity/classroom_entity.dart';
import 'package:classroom/domain/core/entity/students_entity.dart';
import 'package:classroom/domain/core/entity/subject_entity.dart';
import 'package:classroom/domain/core/resource/data_exception.dart';
import 'package:classroom/domain/core/resource/data_state.dart';
import 'package:classroom/domain/models/classrooms_response.dart';
import 'package:classroom/domain/models/students_response.dart';
import 'package:classroom/domain/models/subjects_response.dart';
import 'package:classroom/infrastructure/network_repo.dart';
import 'package:dio/dio.dart';

class NetworkRepoImpli implements NetworkRepo {
  final Dio _dio = Dio(BaseOptions(baseUrl: AppCons.baseUrl));

  final CancelToken _cancelToken = CancelToken();

  @override
  Future<DataState<List<SubjectEntity>>> getSubjects() async {
    try {
      Response<dynamic> response = await _dio.get(
          "${AppCons.subjectFetchApi}/?api_key=${AppCons.apiKey}",
          cancelToken: _cancelToken);
      if (response.statusCode == 200) {
        String data0 = json.encode(response.data);
        SubjectResponse data = subjectResponseFromJson(data0);
        return DataSuccess(data.subjects);
      } else {
        return DataFailed(DataError(
            errorMessage:
                'Failed to fetch subjects. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      return DataFailed(DataError(errorMessage: e.toString()));
    }
  }

  @override
  Future<DataState<List<StudentEntity>>> getStudents() async {
    try {
      Response<dynamic> response = await _dio.get(
          "${AppCons.studentsFetchApi}/?api_key=${AppCons.apiKey}",
          cancelToken: _cancelToken);
      if (response.statusCode == 200) {
        String data0 = json.encode(response.data);
        StudentsResponse data = studentsResponseFromJson(data0);
        return DataSuccess(data.students);
      } else {
        return DataFailed(DataError(
            errorMessage:
                'Failed to fetch students. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      return DataFailed(DataError(errorMessage: e.toString()));
    }
  }

  @override
  Future<DataState<List<ClassroomEntity>>> getClassrooms() async {
    try {
      Response<dynamic> response = await _dio.get(
          "${AppCons.classroomsFetchApi}/?api_key=${AppCons.apiKey}",
          cancelToken: _cancelToken);
      if (response.statusCode == 200) {
        String data0 = json.encode(response.data);
        ClassroomsResponse data = classroomsResponseFromJson(data0);
        return DataSuccess(data.classrooms);
      } else {
        return DataFailed(DataError(
            errorMessage:
                'Failed to fetch Classrooms. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      return DataFailed(DataError(errorMessage: e.toString()));
    }
  }
}
