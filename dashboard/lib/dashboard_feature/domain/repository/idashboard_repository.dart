import 'package:core/database/entitys/collaborator.dart';
import 'package:core/database/entitys/sale.dart';
import 'package:fpdart/fpdart.dart';

abstract class IDashboardRepository {
  Future<List<Collaborator>> getCollaborators();

  Future<Collaborator?> getCollaboratorById(int id);

  Future<Unit> insertCollaborator(Collaborator collaborator);

  Future<Unit> removeCollaborator(Collaborator collaborator);

  Future<Unit> removeSale(Sale sale);

  Future<Unit> addSale(Sale sale);

  Future<List<Sale>> getCollaboratorSales(int id);
}
