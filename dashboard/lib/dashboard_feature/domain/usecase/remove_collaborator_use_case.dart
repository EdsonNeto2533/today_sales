import '../../presentation/usecase/iremove_colaborator_use_case.dart';
import '../model/dashboard_collaborator_model.dart';
import '../repository/idashboard_repository.dart';

class RemoveCollaboratorUseCase implements IRemoveCollaboratorUseCase {
  final IDashboardRepository _repository;

  RemoveCollaboratorUseCase({required IDashboardRepository repository})
      : _repository = repository;

  @override
  Future<void> removeColaborator(DashboardCollaboratorModel collaborator) {
    return _repository.removeCollaborator(collaborator.toEntity());
  }
}
