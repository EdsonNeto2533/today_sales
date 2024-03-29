import 'package:fpdart/fpdart.dart';

import '../../presentation/usecase/iremove_colaborator_use_case.dart';
import '../model/dashboard_collaborator_model.dart';
import '../repository/idashboard_repository.dart';

class RemoveCollaboratorUseCase implements IRemoveCollaboratorUseCase {
  final IDashboardRepository _repository;

  RemoveCollaboratorUseCase({required IDashboardRepository repository})
      : _repository = repository;

  @override
  Future<Unit> removeColaborator(
    DashboardCollaboratorModel collaborator,
  ) async {
    for (var element in collaborator.sales) {
      await _repository.removeSale(element);
    }
    return _repository.removeCollaborator(collaborator.toEntity());
  }
}
