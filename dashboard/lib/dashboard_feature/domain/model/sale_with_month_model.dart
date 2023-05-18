import 'package:core/database/entitys/sale.dart';

class SaleWithMonthModel {
  String month;
  List<Sale> sales;
  SaleWithMonthModel({
    required this.month,
    required this.sales,
  });

  double getValues() {
    var value = 0.0;
    for (var element in sales) {
      value += element.value;
    }
    return value;
  }

  int getNumberOfSales() {
    return sales.length;
  }
}
