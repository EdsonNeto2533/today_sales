import 'package:core/database/entitys/collaborator.dart';
import 'package:core/database/entitys/sale.dart';

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
}
