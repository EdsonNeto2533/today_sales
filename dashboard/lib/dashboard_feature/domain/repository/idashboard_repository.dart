import 'package:core/database/entitys/collaborator.dart';
import 'package:core/database/entitys/sale.dart';

abstract class IDashboardRepository {
  Future<List<Collaborator>> getCollaborators();

  Future<Collaborator?> getCollaboratorById(int id);

  Future<void> insertCollaborator(Collaborator collaborator);

  Future<void> removeCollaborator(Collaborator collaborator);

  Future<void> addSale(Sale sale);

  Future<List<Sale>> getCollaboratorSales(int id);
}
