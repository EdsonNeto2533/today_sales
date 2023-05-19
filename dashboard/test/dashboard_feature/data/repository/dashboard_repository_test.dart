import 'package:core/database/dao/collaborator_dao.dart';
import 'package:core/database/dao/sale_dao.dart';
import 'package:core/database/entitys/collaborator.dart';
import 'package:core/database/entitys/sale.dart';
import 'package:dashboard/dashboard_feature/data/repository/dashboard_repository.dart';
import 'package:dashboard/dashboard_feature/domain/repository/idashboard_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class CollaboratorDAOMock extends Mock implements CollaboratorDAO {}

class SaleDAOMock extends Mock implements SaleDAO {}

class CollaboratorMock extends Mock implements Collaborator {}

class SaleMock extends Mock implements Sale {}

void main() {
  late IDashboardRepository repository;
  late CollaboratorDAO collaboratorDAO;
  late SaleDAO saleDAO;

  setUp(() {
    collaboratorDAO = CollaboratorDAOMock();
    saleDAO = SaleDAOMock();
    repository = DashboardRepository(
      collaboratorDAO: collaboratorDAO,
      saleDAO: saleDAO,
    );
  });

  test(
    'should return a collaborator list when getCollaborators is called',
    () async {
      //Arrange
      final colaboratorListMock = [CollaboratorMock()];
      when(
        () => collaboratorDAO.getCollaborators(),
      ).thenAnswer(
        (_) async => colaboratorListMock,
      );

      //Act
      final response = await repository.getCollaborators();

      //Assert
      expect(response, colaboratorListMock);
    },
  );

  test(
    'should return a collaborator when getCollaborators by id is called',
    () async {
      //Arrange
      const int idMock = 123;
      final colaboratorMock = CollaboratorMock();
      when(
        () => collaboratorDAO.getCollaboratorById(idMock),
      ).thenAnswer(
        (_) async => colaboratorMock,
      );

      //Act
      final response = await repository.getCollaboratorById(idMock);

      //Assert
      expect(response, colaboratorMock);
    },
  );

  test(
    'should return void when add collaborator is called',
    () async {
      //Arrange
      final colaboratorMock = CollaboratorMock();
      when(
        () => collaboratorDAO.insertCollaborator(colaboratorMock),
      ).thenAnswer((_) async {
        return;
      });

      //Act
      final response = await repository.insertCollaborator(colaboratorMock);

      //Assert
      expect(response, unit);
    },
  );

  test(
    'should return void when remove collaborator is called',
    () async {
      //Arrange
      final colaboratorMock = CollaboratorMock();
      when(
        () => collaboratorDAO.removeCollaborator(colaboratorMock),
      ).thenAnswer((_) async {
        return;
      });

      //Act
      final response = await repository.removeCollaborator(colaboratorMock);

      //Assert
      expect(response, unit);
    },
  );

  test(
    'should return void when remove sale is called',
    () async {
      //Arrange
      final sale = SaleMock();
      when(
        () => saleDAO.deleteSale(sale),
      ).thenAnswer((_) async {
        return;
      });

      //Act
      final response = await repository.removeSale(sale);

      //Assert
      expect(response, unit);
    },
  );

  test(
    'should return void when add sale is called',
    () async {
      //Arrange
      final sale = SaleMock();
      when(
        () => saleDAO.insertSale(sale),
      ).thenAnswer((_) async {
        return;
      });

      //Act
      final response = await repository.addSale(sale);

      //Assert
      expect(response, unit);
    },
  );

  test(
    'should return a list of sales when get collaboratorSales is called',
    () async {
      //Arrange
      final salesList = [SaleMock()];
      when(
        () => saleDAO.getSaleByCollaboratorId(any()),
      ).thenAnswer((_) async {
        return salesList;
      });

      //Act
      final response = await repository.getCollaboratorSales(123);

      //Assert
      expect(response, salesList);
    },
  );
}
