import 'package:get_it/get_it.dart';
import 'package:today_sale/commons/database/dao/collaborator_dao.dart';
import 'package:today_sale/commons/utils/constants/app_constants.dart';
import 'package:today_sale/sales_database.dart';

final dependencies = GetIt.instance;

void registerDepencies() {
  _registerDatabaseDependencies();
  _registerRepositoryDependencies();
  _registerUseCaseDependencies();
}

void _registerDatabaseDependencies() {
  //Add database to depence injection
  dependencies.registerLazySingletonAsync<SalesDatabase>(
    () async => await $FloorSalesDatabase
        .databaseBuilder(Constants().databaseReference)
        .build(),
  );

  //Get a dao instance from the database injection
  dependencies.registerSingletonWithDependencies<CollaboratorDAO>(
      () => dependencies.get<SalesDatabase>().collaboratorDAO,
      dependsOn: [SalesDatabase]);
}

void _registerUseCaseDependencies() {}

void _registerRepositoryDependencies() {}
