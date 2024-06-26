import 'package:classroom/domain/core/entity/classroom_entity.dart';
import 'package:classroom/domain/core/entity/registration_entity.dart';
import 'package:classroom/domain/core/entity/students_entity.dart';
import 'package:classroom/domain/core/entity/subject_entity.dart';
import 'package:classroom/domain/core/resource/data_state.dart';
import 'package:classroom/domain/models/classroom_update.dart';
import 'package:classroom/domain/models/registration_update.dart';

abstract class NetworkRepo {
  Future<DataState<List<SubjectEntity>>> getSubjects();
  Future<DataState<List<StudentEntity>>> getStudents();
  Future<DataState<List<ClassroomEntity>>> getClassrooms();

  Future<DataState<SubjectEntity>> getSubjectBtId(int subId);
  Future<DataState<StudentEntity>> getStudentBtId(int studId);

  Future<DataState<ClassroomEntity>> getClassroomById(int classId);

  Future<DataState<ClassroomEntity>> updateClassroomSubject(ClassroomUpdate data);

  Future<DataState<List<RegistrationEntity>>> getRegistrations();

  Future<DataState<String>> deleteRegistration(int regId);
  Future<DataState<bool>> newRegistration(RegistrationUpdate registrationUpdate);
}
