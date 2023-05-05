import 'package:dashboard/dashboard_feature/domain/model/dashboard_collaborator_model.dart';

abstract class IAddCollaboratorsUseCase {
  Future<void> addCollaborator(DashboardCollaboratorModel collaborator);
}
