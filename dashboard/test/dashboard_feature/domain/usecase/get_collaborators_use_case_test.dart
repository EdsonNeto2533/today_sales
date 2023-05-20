import 'package:core/database/entitys/collaborator.dart';
import 'package:core/database/entitys/sale.dart';
import 'package:dashboard/dashboard_feature/domain/model/dashboard_collaborator_model.dart';
import 'package:dashboard/dashboard_feature/domain/repository/idashboard_repository.dart';
import 'package:dashboard/dashboard_feature/domain/usecase/get_collaborators_use_case.dart';
import 'package:dashboard/dashboard_feature/presentation/usecase/iget_collaborators_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../factory/collaborator_factory.dart';
import '../../../factory/sale_factory.dart';

class RepositoryMock extends Mock implements IDashboardRepository {}

class Teste extends Mock implements DashboardCollaboratorModel {}

void main() {
  late IDashboardRepository repository;
  List<Collaborator> collaboratorList =
      CollaboratorFactory.generateCollaboratorList();
  List<Sale> salesList = SaleFactory.generateSalesList();
  late IGetCollaboratorsUseCase useCase;

  setUp(() {
    repository = RepositoryMock();
    salesList = [];
    useCase = GetCollaboratorsUseCase(repository: repository);
  });

  test(
      'should return a collaborator list with sales when getCollaborators is called with success',
      () async {
    //Arrange
    when(
      () => repository.getCollaborators(),
    ).thenAnswer(
      (invocation) async => collaboratorList,
    );

    when(
      () => repository.getCollaboratorSales(any()),
    ).thenAnswer(
      (invocation) async => salesList,
    );

    //Act
    final response = await useCase.getCollaborators();

    //Assert
    expect(response, isA<List<DashboardCollaboratorModel>>());
    expect(response.length, collaboratorList.length);
  });
}
