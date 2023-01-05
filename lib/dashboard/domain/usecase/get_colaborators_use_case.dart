import 'package:today_sale/commons/database/entitys/collaborator.dart';
import 'package:today_sale/dashboard/domain/repository/idashboard_repository.dart';
import 'package:today_sale/dashboard/presentation/usecase/iget_colaborators_use_case.dart';

class GetColaboratorsUseCase implements IGetColaboratorsUseCase {
  IDashboardRepository repository;

  GetColaboratorsUseCase({required this.repository});

  @override
  Future<List<Collaborator>> getCollaborators() {
    return repository.getCollaborators();
  }
}
