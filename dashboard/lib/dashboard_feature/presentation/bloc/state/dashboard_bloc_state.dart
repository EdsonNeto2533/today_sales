import 'package:core/database/entitys/collaborator.dart';

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
  final List<Collaborator> collaborators;

  const SuccessBlocState(this.collaborators);
}
