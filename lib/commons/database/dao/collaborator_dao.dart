import 'dart:ffi';

import 'package:floor/floor.dart';
import 'package:today_sale/commons/database/entitys/collaborator.dart';

@dao
abstract class CollaboratorDAO {
  @Query("select * from Collaborator")
  Future<List<Collaborator>> getCollaborators();

  @Query("select * from Collaborator where id = :collaboratorId")
  Future<Collaborator?> getCollaboratorById(int collaboratorId);

  @insert
  Future<void> insertCollaborator(Collaborator collaborator);

  @delete
  Future<void> removeCollaborator(Collaborator collaborator);
}
