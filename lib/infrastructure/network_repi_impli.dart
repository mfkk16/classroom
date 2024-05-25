import 'dart:convert';

import 'package:classroom/domain/constants/app_cons.dart';
import 'package:classroom/domain/core/entity/classroom_entity.dart';
import 'package:classroom/domain/core/entity/registration_entity.dart';
import 'package:classroom/domain/core/entity/students_entity.dart';
import 'package:classroom/domain/core/entity/subject_entity.dart';
import 'package:classroom/domain/core/resource/data_exception.dart';
import 'package:classroom/domain/core/resource/data_state.dart';
import 'package:classroom/domain/models/classroom_update.dart';
import 'package:classroom/domain/models/classrooms_response.dart';
import 'package:classroom/domain/models/registration_new_response.dart';
import 'package:classroom/domain/models/registration_response.dart';
import 'package:classroom/domain/models/registration_update.dart';
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
      Response<dynamic> response = await _dio.get("${AppCons.subjectFetchApi}/?api_key=${AppCons.apiKey}", cancelToken: _cancelToken);
      if (response.statusCode == 200) {
        String data0 = json.encode(response.data);
        SubjectResponse data = subjectResponseFromJson(data0);
        return DataSuccess(data.subjects);
      } else {
        return DataFailed(DataError(errorMessage: 'Failed to fetch subjects. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      return DataFailed(DataError(errorMessage: e.toString()));
    }
  }

  @override
  Future<DataState<List<StudentEntity>>> getStudents() async {
    try {
      Response<dynamic> response = await _dio.get("${AppCons.studentsFetchApi}/?api_key=${AppCons.apiKey}", cancelToken: _cancelToken);
      if (response.statusCode == 200) {
        String data0 = json.encode(response.data);
        StudentsResponse data = studentsResponseFromJson(data0);
        return DataSuccess(data.students);
      } else {
        return DataFailed(DataError(errorMessage: 'Failed to fetch students. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      return DataFailed(DataError(errorMessage: e.toString()));
    }
  }

  @override
  Future<DataState<List<ClassroomEntity>>> getClassrooms() async {
    try {
      Response<dynamic> response = await _dio.get("${AppCons.classroomsFetchApi}/?api_key=${AppCons.apiKey}", cancelToken: _cancelToken);
      if (response.statusCode == 200) {
        String data0 = json.encode(response.data);
        ClassroomsResponse data = classroomsResponseFromJson(data0);
        return DataSuccess(data.classrooms);
      } else {
        return DataFailed(DataError(errorMessage: 'Failed to fetch Classrooms. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      return DataFailed(DataError(errorMessage: e.toString()));
    }
  }

  @override
  Future<DataState<ClassroomEntity>> getClassroomById(int id) async {
    try {
      Response<dynamic> response = await _dio.get("${AppCons.classroomsFetchApi}/$id?api_key=${AppCons.apiKey}", cancelToken: _cancelToken);
      if (response.statusCode == 200) {
        Classroom data = Classroom.fromJson(response.data);
        return DataSuccess(data);
      } else {
        return DataFailed(DataError(errorMessage: 'Failed to fetch Classrooms. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      return DataFailed(DataError(errorMessage: e.toString()));
    }
  }

  @override
  Future<DataState<SubjectEntity>> getSubjectBtId(int id) async {
    try {
      Response<dynamic> response = await _dio.get("${AppCons.subjectFetchApi}/$id?api_key=${AppCons.apiKey}", cancelToken: _cancelToken);
      if (response.statusCode == 200) {
        Subject data = Subject.fromJson(response.data);
        return DataSuccess(data);
      } else {
        return DataFailed(DataError(errorMessage: 'Failed to fetch Subject. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      return DataFailed(DataError(errorMessage: e.toString()));
    }
  }

  @override
  Future<DataState<ClassroomEntity>> updateClassroomSubject(ClassroomUpdate data) async {
    try {
      final options = Options(contentType: Headers.formUrlEncodedContentType);

      Response<dynamic> response = await _dio.patch(
        "${AppCons.classroomsFetchApi}/${data.classroomId}?api_key=${AppCons.apiKey}",
        cancelToken: _cancelToken,
        data: {"subject": data.subjectId},
        options: options,
      );
      if (response.statusCode == 200) {
        Classroom data = Classroom.fromJson(response.data);
        return DataSuccess(data);
      } else {
        return DataFailed(DataError(errorMessage: 'Failed to update Subject. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      return DataFailed(DataError(errorMessage: e.toString()));
    }
  }

  @override
  Future<DataState<List<RegistrationEntity>>> getRegistrations() async {
    try {
      Response<dynamic> response = await _dio.get("${AppCons.registrationFetchApi}/?api_key=${AppCons.apiKey}", cancelToken: _cancelToken);
      if (response.statusCode == 200) {
        String data0 = json.encode(response.data);
        RegistrationsResponse data = registrationsResponseFromJson(data0);
        return DataSuccess(data.registrations);
      } else {
        return DataFailed(DataError(errorMessage: 'Failed to fetch registrations. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      return DataFailed(DataError(errorMessage: e.toString()));
    }
  }

  @override
  Future<DataState<StudentEntity>> getStudentBtId(int studId) async {
    try {
      Response<dynamic> response = await _dio.get("${AppCons.studentsFetchApi}/$studId?api_key=${AppCons.apiKey}", cancelToken: _cancelToken);
      if (response.statusCode == 200) {
        Student data = Student.fromJson(response.data);
        return DataSuccess(data);
      } else {
        return DataFailed(DataError(errorMessage: 'Failed to fetch Student. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      return DataFailed(DataError(errorMessage: e.toString()));
    }
  }

  @override
  Future<DataState<String>> deleteRegistration(int regId) async {
    try {
      Response<dynamic> response = await _dio.delete("${AppCons.registrationFetchApi}/$regId?api_key=${AppCons.apiKey}", cancelToken: _cancelToken);
      if (response.statusCode == 200) {
        String data = response.data["message"];
        return DataSuccess(data);
      } else {
        return DataFailed(DataError(errorMessage: 'Failed to fetch Student. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      return DataFailed(DataError(errorMessage: e.toString()));
    }
  }

  @override
  Future<DataState<bool>> newRegistration(RegistrationUpdate registrationUpdate) async {
    try {
      final options = Options(
        contentType: Headers.formUrlEncodedContentType,
        validateStatus: (status) {
          return status != null && (status < 400 || status == 308 || status == 409);
        },
      );

      Response<dynamic> response = await _dio.post(
        "${AppCons.registrationFetchApi}?api_key=${AppCons.apiKey}",
        cancelToken: _cancelToken,
        data: {"subject": registrationUpdate.subjectId, "student": registrationUpdate.studentId},
        options: options,
      );

      if (response.statusCode == 308) {
        String? redirectUrl = response.headers.value('location');
        if (redirectUrl != null) {
          response = await _dio.post(
            redirectUrl,
            cancelToken: _cancelToken,
            data: {"subject": registrationUpdate.subjectId, "student": registrationUpdate.studentId},
            options: options,
          );
        } else {
          return DataFailed(DataError(errorMessage: "Redirect URL not found in the response headers."));
        }
      }

      if (response.statusCode == 200) {
        String data0 = json.encode(response.data);
        RegistrationNewResponse data = registrationNewResponseFromJson(data0);
        return DataSuccess(data.error == null ? true : false);
      } else {
        return DataFailed(DataError(errorMessage: response.data["error"]));
      }
    } catch (e) {
      return DataFailed(DataError(errorMessage: e.toString()));
    }
  }
}
