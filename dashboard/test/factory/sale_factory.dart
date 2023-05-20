import 'package:core/database/entitys/sale.dart';

class SaleFactory {
  static Sale generateSale() {
    return Sale(value: 100, collaboratorId: 1, saleDate: DateTime.now());
  }

  static List<Sale> generateSalesList() {
    return [
      generateSale(),
      generateSale(),
    ];
  }
}
