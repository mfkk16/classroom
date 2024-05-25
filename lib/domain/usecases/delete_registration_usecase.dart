import 'package:classroom/domain/core/resource/data_state.dart';
import 'package:classroom/domain/core/usecase/usecase.dart';
import 'package:classroom/infrastructure/network_repo.dart';

class DeleteRegistrationUsecase extends Usecase<DataState<String>, int> {
  final NetworkRepo _networkRepo;

  DeleteRegistrationUsecase(this._networkRepo);
  @override
  Future<DataState<String>> call({int? params}) async {
    return await _networkRepo.deleteRegistration(params!);
  }
}
