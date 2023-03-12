import 'package:core/database/entitys/collaborator.dart';

abstract class IAddCollaboratorsUseCase {
  Future<void> addCollaborator(Collaborator collaborator);
}
