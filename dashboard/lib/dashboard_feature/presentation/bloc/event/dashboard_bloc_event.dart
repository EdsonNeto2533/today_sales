import 'package:core/database/entitys/sale.dart';
import 'package:dashboard/dashboard_feature/domain/model/dashboard_collaborator_model.dart';

abstract class DashboardBlocEvent {
  const DashboardBlocEvent();
}

class GetAllCollaboratosBlocEvent extends DashboardBlocEvent {
  const GetAllCollaboratosBlocEvent();
}

class AddCollaboratoBlocEvent extends DashboardBlocEvent {
  final DashboardCollaboratorModel collaborator;
  const AddCollaboratoBlocEvent(this.collaborator);
}

class AddSaleBlocEvent extends DashboardBlocEvent {
  final Sale sale;
  const AddSaleBlocEvent(this.sale);
}

class RemoveCollaboratoBlocEvent extends DashboardBlocEvent {
  final DashboardCollaboratorModel collaborator;
  const RemoveCollaboratoBlocEvent(this.collaborator);
}
