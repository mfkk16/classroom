import 'package:classroom/domain/core/entity/students_entity.dart';
import 'package:classroom/domain/core/resource/data_state.dart';
import 'package:classroom/domain/core/usecase/usecase.dart';
import 'package:classroom/infrastructure/network_repo.dart';

class GetStudentByIdUsecase extends Usecase<DataState<StudentEntity>, int> {
  final NetworkRepo _networkRepo;

  GetStudentByIdUsecase(this._networkRepo);

  @override
  Future<DataState<StudentEntity>> call({int? params}) async {
    return await _networkRepo.getStudentBtId(params!);
  }
}
