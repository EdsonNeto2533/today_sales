import '../../../../core/lib/database/entitys/collaborator.dart';

abstract class IAddCollaboratorsUseCase {
  Future<void> addCollaborator(Collaborator collaborator);
}
