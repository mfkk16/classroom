import 'package:classroom/domain/core/entity/classroom_entity.dart';
import 'package:classroom/domain/core/resource/data_state.dart';
import 'package:classroom/domain/core/usecase/usecase.dart';
import 'package:classroom/domain/models/classroom_update.dart';
import 'package:classroom/infrastructure/network_repo.dart';

class SetClassroomSubjectUsecase
    extends Usecase<DataState<ClassroomEntity>, ClassroomUpdate> {
  final NetworkRepo _networkRepo;

  SetClassroomSubjectUsecase(this._networkRepo);

  @override
  Future<DataState<ClassroomEntity>> call({ClassroomUpdate? params}) async {
    return await _networkRepo.updateClassroomSubject(params!);
  }
}
