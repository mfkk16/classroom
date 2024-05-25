import 'package:classroom/domain/core/entity/classroom_entity.dart';
import 'package:classroom/domain/core/resource/data_state.dart';
import 'package:classroom/domain/core/usecase/usecase.dart';
import 'package:classroom/infrastructure/network_repo.dart';

class GetClassroomByIdUsecase extends Usecase<DataState<ClassroomEntity>, int> {
  final NetworkRepo _networkRepo;

  GetClassroomByIdUsecase(this._networkRepo);
  @override
  Future<DataState<ClassroomEntity>> call({int? params}) async {
    return await _networkRepo.getClassroomById(params!);
  }
}
