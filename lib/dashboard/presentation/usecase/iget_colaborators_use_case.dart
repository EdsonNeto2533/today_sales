import 'package:today_sale/commons/database/entitys/collaborator.dart';

abstract class IGetColaboratorsUseCase {
  Future<List<Collaborator>> getCollaborators();
}
