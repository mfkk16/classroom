import 'package:classroom/domain/core/entity/registration_entity.dart';
import 'package:classroom/domain/core/resource/data_state.dart';
import 'package:classroom/domain/core/usecase/usecase.dart';
import 'package:classroom/infrastructure/network_repo.dart';

class GetAllRegistrationUsecase extends Usecase<DataState<List<RegistrationEntity>>, void> {
  final NetworkRepo _networkRepo;

  GetAllRegistrationUsecase(this._networkRepo);

  @override
  Future<DataState<List<RegistrationEntity>>> call({void params}) async {
    return await _networkRepo.getRegistrations();
  }
}
