import 'package:dashboard/dashboard_feature/domain/model/dashboard_collaborator_model.dart';

abstract class CollaboratorDetailsBlocState {
  const CollaboratorDetailsBlocState();
}

class ErrorCollaboratorState extends CollaboratorDetailsBlocState {}

class LoadingCollaboratorState extends CollaboratorDetailsBlocState {}

class SuccessCollaboratorState extends CollaboratorDetailsBlocState {
  final DashboardCollaboratorModel collaboratorModel;
  const SuccessCollaboratorState({required this.collaboratorModel});
}
