import 'package:today_sale/commons/database/entitys/collaborator.dart';

abstract class IAddCollaboratorsUseCase {
  Future<void> addCollaborator(Collaborator collaborator);
}
