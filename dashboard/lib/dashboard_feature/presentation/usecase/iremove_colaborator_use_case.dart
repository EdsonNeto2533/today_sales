import 'package:core/database/entitys/collaborator.dart';

abstract class IRemoveCollaboratorUseCase {
  Future<void> removeColaborator(Collaborator collaborator);
}
