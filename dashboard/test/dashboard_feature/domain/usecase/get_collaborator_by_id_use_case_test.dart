// import 'package:core/database/entitys/collaborator.dart';
// import 'package:core/database/entitys/sale.dart';
// import 'package:dashboard/dashboard_feature/domain/model/dashboard_collaborator_model.dart';
// import 'package:dashboard/dashboard_feature/domain/repository/idashboard_repository.dart';
// import 'package:dashboard/dashboard_feature/domain/usecase/get_collaborator_by_id_use_case.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';

// class RepositoryMock extends Mock implements IDashboardRepository {}

// class CollaboratorMock extends Mock implements Collaborator {}

// class DashboardCollaboratorMock extends Mock
//     implements DashboardCollaboratorModel {}

// void main() {
//   late IDashboardRepository repository;
//   late IGetCollaboratorByIdUseCase useCase;

//   setUp(() {
//     repository = RepositoryMock();
//     useCase = GetCollaboratorByIdUseCase(repository);
//   });
//   test('get collaborator by id use case ...', () async {
//     Collaborator collaborator = Collaborator(
//       name: "name",
//       description: "",
//       id: 1,
//     );

//     var teste = [
//       Sale(
//         value: 10,
//         collaboratorId: 1,
//         saleDate: DateTime.now(),
//       )
//     ];

//     DashboardCollaboratorModel model = DashboardCollaboratorModel(
//       name: "name",
//       description: "",
//       id: 1,
//       sales: teste,
//     );

//     when(
//       () => repository.getCollaboratorById(any()),
//     ).thenAnswer(
//       (invocation) async => collaborator,
//     );

//     when(
//       () => repository.getCollaboratorSales(any()),
//     ).thenAnswer(
//       (invocation) async => teste,
//     );

//     // when(
//     //   () => DashboardCollaboratorModel.fromEntity(collaborator),
//     // ).thenReturn(model);

//     var response = await useCase.execute(1);

//     expect(response, model);
//   });
// }
