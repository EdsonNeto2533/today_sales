import 'package:today_sale/commons/database/entitys/collaborator.dart';

abstract class IAddColaboratorsUseCase {
  Future<void> addCollaborator(Collaborator collaborator);
}
