import '../../domain/model/dashboard_collaborator_model.dart';

abstract class IRemoveCollaboratorUseCase {
  Future<void> removeColaborator(DashboardCollaboratorModel collaborator);
}
