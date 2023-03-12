import 'package:core/database/entitys/collaborator.dart';

import '../../presentation/usecase/iadd_collaborators_use_case.dart';
import '../repository/idashboard_repository.dart';

class AddCollaboratorsUseCase implements IAddCollaboratorsUseCase {
  final IDashboardRepository _repository;

  AddCollaboratorsUseCase({required IDashboardRepository repository})
      : _repository = repository;

  @override
  Future<void> addCollaborator(Collaborator collaborator) {
    return _repository.insertCollaborator(collaborator);
  }
}
