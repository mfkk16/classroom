import 'package:classroom/domain/core/entity/students_entity.dart';
import 'package:classroom/domain/core/resource/data_state.dart';
import 'package:classroom/domain/core/usecase/usecase.dart';
import 'package:classroom/infrastructure/network_repo.dart';

class GetAllStudentsUsecase
    extends Usecase<DataState<List<StudentEntity>>, void> {
  final NetworkRepo _networkRepo;

  GetAllStudentsUsecase(this._networkRepo);

  @override
  Future<DataState<List<StudentEntity>>> call({void params}) async {
    return await _networkRepo.getStudents();
  }
}
