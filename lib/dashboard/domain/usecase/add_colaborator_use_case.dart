import 'package:today_sale/commons/database/entitys/collaborator.dart';
import 'package:today_sale/dashboard/domain/repository/idashboard_repository.dart';
import 'package:today_sale/dashboard/presentation/usecase/iadd_colaborators_use_case.dart';

class AddColaboratorsUseCase implements IAddColaboratorsUseCase {
  IDashboardRepository repository;

  AddColaboratorsUseCase({required this.repository});

  @override
  Future<void> addCollaborator(Collaborator collaborator) {
    return repository.insertCollaborator(collaborator);
  }
}
