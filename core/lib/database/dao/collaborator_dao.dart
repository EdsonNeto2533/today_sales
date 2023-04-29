import 'package:floor/floor.dart';

import '../entitys/collaborator.dart';

@dao
abstract class CollaboratorDAO {
  @Query('SELECT * FROM collaborator_table')
  Future<List<Collaborator>> getCollaborators();

  @Query("SELECT * FROM collaborator_table WHERE id = :collaboratorId")
  Future<Collaborator?> getCollaboratorById(int collaboratorId);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertCollaborator(Collaborator collaborator);

  @delete
  Future<void> removeCollaborator(Collaborator collaborator);
}
