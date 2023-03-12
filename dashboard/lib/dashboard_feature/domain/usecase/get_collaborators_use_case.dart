import 'package:core/database/entitys/collaborator.dart';

import '../../presentation/usecase/iget_collaborators_use_case.dart';
import '../repository/idashboard_repository.dart';

class GetCollaboratorsUseCase implements IGetCollaboratorsUseCase {
  final IDashboardRepository _repository;

  GetCollaboratorsUseCase({required IDashboardRepository repository})
      : _repository = repository;

  @override
  Future<List<Collaborator>> getCollaborators() {
    return _repository.getCollaborators();
  }
}
