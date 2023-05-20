import 'package:core/database/entitys/collaborator.dart';
import 'package:dashboard/dashboard_feature/domain/model/dashboard_collaborator_model.dart';

class CollaboratorFactory {
  static Collaborator generateCollaborator() {
    return Collaborator(name: "Fake", description: "Fake desc", id: 1);
  }

  static List<Collaborator> generateCollaboratorList() {
    return [
      generateCollaborator(),
      generateCollaborator(),
    ];
  }

  static DashboardCollaboratorModel generateDashboardCollaborator() {
    return DashboardCollaboratorModel(
        name: "Fake", description: "Fake desc", sales: [], id: 1);
  }

  static List<DashboardCollaboratorModel> generateDashboardCollaboratorList() {
    return [
      generateDashboardCollaborator(),
      generateDashboardCollaborator(),
    ];
  }
}
