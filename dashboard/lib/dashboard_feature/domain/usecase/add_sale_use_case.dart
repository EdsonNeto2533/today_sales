import 'package:core/database/entitys/sale.dart';
import 'package:dashboard/dashboard_feature/domain/repository/idashboard_repository.dart';

abstract class IAddSaleUseCase {
  Future<void> execute(Sale sale);
}

class AddSaleUseCase implements IAddSaleUseCase {
  final IDashboardRepository _repository;

  AddSaleUseCase(this._repository);

  @override
  Future<void> execute(Sale sale) {
    return _repository.addSale(sale);
  }
}
