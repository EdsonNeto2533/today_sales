import 'package:dashboard/dashboard_feature/domain/model/dashboard_collaborator_model.dart';
import 'package:dashboard/dashboard_feature/domain/repository/idashboard_repository.dart';

abstract class IGetCollaboratorByIdUseCase {
  Future<DashboardCollaboratorModel> execute(int id);
}

class GetCollaboratorByIdUseCase implements IGetCollaboratorByIdUseCase {
  final IDashboardRepository _dashboardRepository;
  GetCollaboratorByIdUseCase(this._dashboardRepository);

  @override
  Future<DashboardCollaboratorModel> execute(int id) async {
    final collaborator = await _dashboardRepository.getCollaboratorById(id);
    final collaboratorSales =
        await _dashboardRepository.getCollaboratorSales(id);
    final collaboratorData =
        DashboardCollaboratorModel.fromEntity(collaborator!);
    collaboratorData.sales.addAll(collaboratorSales);
    return collaboratorData;
  }
}
