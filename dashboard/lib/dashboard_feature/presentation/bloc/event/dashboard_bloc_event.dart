import 'package:core/database/entitys/collaborator.dart';
import 'package:core/database/entitys/sale.dart';

abstract class DashboardBlocEvent {
  const DashboardBlocEvent();
}

class GetAllCollaboratosBlocEvent extends DashboardBlocEvent {
  const GetAllCollaboratosBlocEvent();
}

class AddCollaboratoBlocEvent extends DashboardBlocEvent {
  final Collaborator collaborator;
  const AddCollaboratoBlocEvent(this.collaborator);
}

class AddSaleBlocEvent extends DashboardBlocEvent {
  final Sale sale;
  const AddSaleBlocEvent(this.sale);
}

class RemoveCollaboratoBlocEvent extends DashboardBlocEvent {
  final Collaborator collaborator;
  const RemoveCollaboratoBlocEvent(this.collaborator);
}
