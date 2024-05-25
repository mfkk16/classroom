import 'package:classroom/domain/core/resource/data_state.dart';
import 'package:classroom/domain/core/usecase/usecase.dart';
import 'package:classroom/domain/models/registration_update.dart';
import 'package:classroom/infrastructure/network_repo.dart';

class NewRegistrationUsecase extends Usecase<DataState<bool>, RegistrationUpdate> {
  final NetworkRepo _networkRepo;

  NewRegistrationUsecase(this._networkRepo);

  @override
  Future<DataState<bool>> call({RegistrationUpdate? params}) async {
    return await _networkRepo.newRegistration(params!);
  }
}
