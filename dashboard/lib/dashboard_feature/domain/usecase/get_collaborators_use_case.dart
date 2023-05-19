import 'package:dashboard/dashboard_feature/domain/model/dashboard_collaborator_model.dart';

import '../../presentation/usecase/iget_collaborators_use_case.dart';
import '../repository/idashboard_repository.dart';

class GetCollaboratorsUseCase implements IGetCollaboratorsUseCase {
  final IDashboardRepository _repository;

  GetCollaboratorsUseCase({required IDashboardRepository repository})
      : _repository = repository;

  @override
  Future<List<DashboardCollaboratorModel>> getCollaborators() async {
    final collaborators = await _repository.getCollaborators();

    final collaboratorsList = collaborators
        .map((e) => DashboardCollaboratorModel.fromEntity(e))
        .toList();

    for (var element in collaboratorsList) {
      final sales = await _repository.getCollaboratorSales(element.id!);
      element.sales.addAll(sales);
    }

    return collaboratorsList;
  }
}
