import 'package:core/database/dao/collaborator_dao.dart';
import 'package:core/database/entitys/collaborator.dart';

import '../../domain/repository/idashboard_repository.dart';

class DashboardRepository implements IDashboardRepository {
  final CollaboratorDAO _collaboratorDAO;

  DashboardRepository({required CollaboratorDAO collaboratorDAO})
      : _collaboratorDAO = collaboratorDAO;

  @override
  Future<Collaborator?> getCollaboratorById(int id) {
    return _collaboratorDAO.getCollaboratorById(id);
  }

  @override
  Future<List<Collaborator>> getCollaborators() {
    return _collaboratorDAO.getCollaborators();
  }

  @override
  Future<void> insertCollaborator(Collaborator collaborator) {
    return _collaboratorDAO.insertCollaborator(collaborator);
  }

  @override
  Future<void> removeCollaborator(Collaborator collaborator) {
    return _collaboratorDAO.removeCollaborator(collaborator);
  }
}
