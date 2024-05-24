import 'package:classroom/domain/core/entity/subject_entity.dart';
import 'package:classroom/domain/core/resource/data_state.dart';
import 'package:classroom/domain/core/usecase/usecase.dart';
import 'package:classroom/infrastructure/network_repo.dart';

class GetAllSubjectsUsecase
    extends Usecase<DataState<List<SubjectEntity>>, void> {
  final NetworkRepo _networkRepo;

  GetAllSubjectsUsecase(this._networkRepo);

  @override
  Future<DataState<List<SubjectEntity>>> call({void params}) async {
    return await _networkRepo.getSubjects();
  }
}
