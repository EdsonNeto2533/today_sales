import 'package:today_sale/commons/database/entitys/collaborator.dart';
import 'package:today_sale/dashboard/domain/repository/idashboard_repository.dart';
import 'package:today_sale/dashboard/presentation/usecase/iadd_colaborators_use_case.dart';

class AddColaboratorsUseCase implements IAddColaboratorsUseCase {
  final IDashboardRepository _repository;

  AddColaboratorsUseCase({required IDashboardRepository repository})
      : _repository = repository;

  @override
  Future<void> addCollaborator(Collaborator collaborator) {
    return _repository.insertCollaborator(collaborator);
  }
}
