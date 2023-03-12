import 'package:core/database/entitys/collaborator.dart';

abstract class IGetCollaboratorsUseCase {
  Future<List<Collaborator>> getCollaborators();
}
