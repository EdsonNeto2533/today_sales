import 'package:core/database/entitys/collaborator.dart';
import 'package:core/database/entitys/sale.dart';
import 'package:dashboard/dashboard_feature/domain/model/dashboard_collaborator_model.dart';
import 'package:dashboard/dashboard_feature/domain/repository/idashboard_repository.dart';
import 'package:dashboard/dashboard_feature/domain/usecase/get_collaborator_by_id_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class RepositoryMock extends Mock implements IDashboardRepository {}

void main() {
  late IDashboardRepository repository;
  late IGetCollaboratorByIdUseCase useCase;

  setUp(() {
    repository = RepositoryMock();
    useCase = GetCollaboratorByIdUseCase(repository);
  });
  test(
      'should return a dashboard collaborator when get collaborator by id is called',
      () async {
    Collaborator collaborator = Collaborator(
      id: 1,
      name: "joao",
      description: "vendedor",
    );
    List<Sale> sales = [
      Sale(
        value: 100,
        collaboratorId: 1,
        saleDate: DateTime.now(),
      )
    ];

    when(
      () => repository.getCollaboratorById(any()),
    ).thenAnswer(
      (invocation) async => collaborator,
    );

    when(
      () => repository.getCollaboratorSales(any()),
    ).thenAnswer(
      (invocation) async => sales,
    );

    var response = await useCase.execute(1);

    expect(response, isA<DashboardCollaboratorModel>());
    expect(response.sales.length, sales.length);
    expect(response.name, collaborator.name);
    expect(response.description, collaborator.description);
    expect(response.id, collaborator.id);
  });
}
