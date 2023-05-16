import 'package:commons/commons.dart';
import 'package:core/database/entitys/collaborator.dart';
import 'package:core/database/entitys/sale.dart';
import 'package:intl/intl.dart';

class DashboardCollaboratorModel {
  int? id;
  final String name;
  final String description;
  final List<Sale> sales;

  DashboardCollaboratorModel({
    this.id,
    required this.name,
    required this.description,
    required this.sales,
  });

  factory DashboardCollaboratorModel.fromEntity(Collaborator collaborator) {
    return DashboardCollaboratorModel(
      name: collaborator.name,
      description: collaborator.description,
      id: collaborator.id,
      sales: [],
    );
  }

  Collaborator toEntity() {
    return Collaborator(name: name, description: description, id: id);
  }

  double getTotalSalesValue(DateTime? selectedDate) {
    var value = 0.0;
    for (var element in sales) {
      if (selectedDate != null) {
        value += element.saleDate.isSameYearAndMonth(selectedDate)
            ? element.value
            : 0.0;
      } else {
        value += element.value;
      }
    }
    return value;
  }

  Map<String, List<Sale>> getSalesByMonth() {
    Map<String, List<Sale>> salesByMonth = {};
    sales.sort((a, b) => b.saleDate.compareTo(a.saleDate));

    for (var sale in sales) {
      String month = DateFormat('MMMM yyyy').format(sale.saleDate);

      if (!salesByMonth.containsKey(month)) {
        salesByMonth[month] = [];
      }

      salesByMonth[month]!.add(sale);
    }
    return salesByMonth;
  }

  int getNumberOfSales(DateTime? dateTime) {
    var value = 0;
    for (var element in sales) {
      if (dateTime != null) {
        value += element.saleDate.isSameYearAndMonth(dateTime) ? 1 : 0;
      } else {
        value++;
      }
    }
    return value;
  }
}
