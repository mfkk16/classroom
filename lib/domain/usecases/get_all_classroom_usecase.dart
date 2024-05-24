import 'package:classroom/domain/core/entity/classroom_entity.dart';
import 'package:classroom/domain/core/resource/data_state.dart';
import 'package:classroom/domain/core/usecase/usecase.dart';
import 'package:classroom/infrastructure/network_repo.dart';

class GetAllClassroomUsecase
    extends Usecase<DataState<List<ClassroomEntity>>, void> {
  final NetworkRepo _networkRepo;

  GetAllClassroomUsecase(this._networkRepo);

  @override
  Future<DataState<List<ClassroomEntity>>> call({void params}) async {
    return await _networkRepo.getClassrooms();
  }
}
