import 'package:dashboard/dashboard_feature/domain/model/dashboard_collaborator_model.dart';

abstract class DashboardBlocState {
  const DashboardBlocState();
}

class ErrorDashboardBlocState extends DashboardBlocState {
  final String failure;

  const ErrorDashboardBlocState(this.failure);
}

class LoadingDashboardBlocState extends DashboardBlocState {
  const LoadingDashboardBlocState();
}

class SuccessBlocState extends DashboardBlocState {
  final List<DashboardCollaboratorModel> collaborators;

  const SuccessBlocState(this.collaborators);
}
