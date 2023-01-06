import 'package:today_sale/commons/database/entitys/collaborator.dart';

abstract class IGetCollaboratorsUseCase {
  Future<List<Collaborator>> getCollaborators();
}
