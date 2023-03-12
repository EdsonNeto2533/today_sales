import '../../../../core/lib/database/entitys/collaborator.dart';

abstract class IRemoveCollaboratorUseCase {
  Future<void> removeColaborator(Collaborator collaborator);
}
