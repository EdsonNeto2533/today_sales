import 'package:core/database/entitys/collaborator.dart';

import '../../presentation/usecase/iremove_colaborator_use_case.dart';
import '../repository/idashboard_repository.dart';

class RemoveCollaboratorUseCase implements IRemoveCollaboratorUseCase {
  final IDashboardRepository _repository;

  RemoveCollaboratorUseCase({required IDashboardRepository repository})
      : _repository = repository;

  @override
  Future<void> removeColaborator(Collaborator collaborator) {
    return _repository.removeCollaborator(collaborator);
  }
}
