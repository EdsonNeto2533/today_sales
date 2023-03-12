import '../../../../core/lib/database/entitys/collaborator.dart';
import 'package:today_sale/dashboard/domain/repository/idashboard_repository.dart';
import 'package:today_sale/dashboard/presentation/usecase/iadd_collaborators_use_case.dart';

class AddCollaboratorsUseCase implements IAddCollaboratorsUseCase {
  final IDashboardRepository _repository;

  AddCollaboratorsUseCase({required IDashboardRepository repository})
      : _repository = repository;

  @override
  Future<void> addCollaborator(Collaborator collaborator) {
    return _repository.insertCollaborator(collaborator);
  }
}
