import '../../../../core/lib/database/entitys/collaborator.dart';

abstract class IGetCollaboratorsUseCase {
  Future<List<Collaborator>> getCollaborators();
}
