import 'package:today_sale/commons/database/dao/collaborator_dao.dart';
import 'package:today_sale/commons/database/entitys/collaborator.dart';
import 'package:today_sale/dashboard/domain/repository/idashboard_repository.dart';

class DashboardRepository implements IDashboardRepository {
  CollaboratorDAO collaboratorDAO;

  DashboardRepository({required this.collaboratorDAO});

  @override
  Future<Collaborator?> getCollaboratorById(int id) {
    return collaboratorDAO.getCollaboratorById(id);
  }

  @override
  Future<List<Collaborator>> getCollaborators() {
    return collaboratorDAO.getCollaborators();
  }

  @override
  Future<void> insertCollaborator(Collaborator collaborator) {
    return collaboratorDAO.insertCollaborator(collaborator);
  }

  @override
  Future<void> removeCollaborator(Collaborator collaborator) {
    return collaboratorDAO.removeCollaborator(collaborator);
  }
}
