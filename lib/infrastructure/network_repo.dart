import 'package:classroom/domain/core/entity/students_entity.dart';
import 'package:classroom/domain/core/entity/subject_entity.dart';
import 'package:classroom/domain/core/resource/data_state.dart';

abstract class NetworkRepo {
  Future<DataState<List<SubjectEntity>>> getSubjects();
  Future<DataState<List<StudentEntity>>> getStudents();
}
