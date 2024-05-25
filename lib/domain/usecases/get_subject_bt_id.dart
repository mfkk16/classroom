import 'package:classroom/domain/core/entity/subject_entity.dart';
import 'package:classroom/domain/core/resource/data_state.dart';
import 'package:classroom/domain/core/usecase/usecase.dart';
import 'package:classroom/infrastructure/network_repo.dart';

class GetSubjectBtIdUsecase extends Usecase<DataState<SubjectEntity>, int> {
  final NetworkRepo _networkRepo;

  GetSubjectBtIdUsecase(this._networkRepo);
  @override
  Future<DataState<SubjectEntity>> call({int? params}) async {
    return await _networkRepo.getSubjectBtId(params!);
  }
}
