import '../../../../core/lib/database/entitys/collaborator.dart';

abstract class IDashboardRepository {
  Future<List<Collaborator>> getCollaborators();

  Future<Collaborator?> getCollaboratorById(int id);

  Future<void> insertCollaborator(Collaborator collaborator);

  Future<void> removeCollaborator(Collaborator collaborator);
}
