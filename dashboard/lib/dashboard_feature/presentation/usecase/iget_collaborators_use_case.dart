import '../../domain/model/dashboard_collaborator_model.dart';

abstract class IGetCollaboratorsUseCase {
  Future<List<DashboardCollaboratorModel>> getCollaborators();
}
