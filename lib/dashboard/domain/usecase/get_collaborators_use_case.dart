import '../../../../core/lib/database/entitys/collaborator.dart';
import 'package:today_sale/dashboard/domain/repository/idashboard_repository.dart';
import 'package:today_sale/dashboard/presentation/usecase/iget_collaborators_use_case.dart';

class GetCollaboratorsUseCase implements IGetCollaboratorsUseCase {
  final IDashboardRepository _repository;

  GetCollaboratorsUseCase({required IDashboardRepository repository})
      : _repository = repository;

  @override
  Future<List<Collaborator>> getCollaborators() {
    return _repository.getCollaborators();
  }
}
