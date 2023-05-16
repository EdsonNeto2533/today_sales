import 'package:core/database/dao/collaborator_dao.dart';
import 'package:core/database/dao/sale_dao.dart';
import 'package:core/database/entitys/collaborator.dart';
import 'package:core/database/entitys/sale.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repository/idashboard_repository.dart';

class DashboardRepository implements IDashboardRepository {
  final CollaboratorDAO _collaboratorDAO;
  final SaleDAO _saleDAO;

  DashboardRepository({
    required CollaboratorDAO? collaboratorDAO,
    required SaleDAO? saleDAO,
  })  : _collaboratorDAO = collaboratorDAO!,
        _saleDAO = saleDAO!;

  @override
  Future<Collaborator?> getCollaboratorById(int id) {
    return _collaboratorDAO.getCollaboratorById(id);
  }

  @override
  Future<List<Collaborator>> getCollaborators() {
    return _collaboratorDAO.getCollaborators();
  }

  @override
  Future<Unit> insertCollaborator(Collaborator collaborator) async {
    await _collaboratorDAO.insertCollaborator(collaborator);
    return unit;
  }

  @override
  Future<void> removeCollaborator(Collaborator collaborator) {
    return _collaboratorDAO.removeCollaborator(collaborator);
  }

  @override
  Future<void> addSale(Sale sale) {
    return _saleDAO.insertSale(sale);
  }

  @override
  Future<List<Sale>> getCollaboratorSales(int id) {
    return _saleDAO.getSaleByCollaboratorId(id);
  }

  @override
  Future<Unit> removeSale(Sale sale) async {
    await _saleDAO.deleteSale(sale);
    return unit;
  }
}
