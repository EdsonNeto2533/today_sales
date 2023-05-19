import 'package:fpdart/fpdart.dart';

import '../../domain/model/dashboard_collaborator_model.dart';

abstract class IRemoveCollaboratorUseCase {
  Future<Unit> removeColaborator(DashboardCollaboratorModel collaborator);
}
