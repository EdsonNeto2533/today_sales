import '../../../../core/lib/database/entitys/collaborator.dart';
import 'package:today_sale/dashboard/domain/repository/idashboard_repository.dart';
import 'package:today_sale/dashboard/presentation/usecase/iremove_colaborator_use_case.dart';

class RemoveCollaboratorUseCase implements IRemoveCollaboratorUseCase {
  final IDashboardRepository _repository;

  RemoveCollaboratorUseCase({required IDashboardRepository repository})
      : _repository = repository;

  @override
  Future<void> removeColaborator(Collaborator collaborator) {
    return _repository.removeCollaborator(collaborator);
  }
}
