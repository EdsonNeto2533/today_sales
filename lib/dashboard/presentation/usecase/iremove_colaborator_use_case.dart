import 'package:today_sale/commons/database/entitys/collaborator.dart';

abstract class IRemoveCollaboratorUseCase {
  Future<void> removeColaborator(Collaborator collaborator);
}
