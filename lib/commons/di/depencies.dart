import 'package:get_it/get_it.dart';
import 'package:today_sale/commons/database/dao/collaborator_dao.dart';
import 'package:today_sale/commons/database/dao/sale_dao.dart';
import 'package:today_sale/commons/utils/constants/app_constants.dart';
import 'package:today_sale/dashboard/data/repository/dashboard_repository.dart';
import 'package:today_sale/dashboard/domain/repository/idashboard_repository.dart';
import 'package:today_sale/dashboard/domain/usecase/add_collaborator_use_case.dart';
import 'package:today_sale/dashboard/domain/usecase/remove_collaborator_use_case.dart';
import 'package:today_sale/dashboard/presentation/cubit/dashboard_collaborators_cubit.dart';
import 'package:today_sale/dashboard/presentation/usecase/iadd_collaborators_use_case.dart';
import 'package:today_sale/dashboard/presentation/usecase/iget_collaborators_use_case.dart';
import 'package:today_sale/dashboard/presentation/usecase/iremove_colaborator_use_case.dart';
import 'package:today_sale/sales_database.dart';

import '../../dashboard/domain/usecase/get_collaborators_use_case.dart';

final dependencies = GetIt.instance;

void registerDepencies() {
  dependencies.allowReassignment = true;
  _registerDatabaseDependencies();
  _registerRepositoryDependencies();
  _registerUseCaseDependencies();
  _registerCubitDependencies();
}

void _registerCubitDependencies() {
  dependencies.registerFactory<DashboardCollaboratorsCubit>(
    () => DashboardCollaboratorsCubit(
        getCollaboratorsUseCase: dependencies.get(),
        addColaboratorsUseCase: dependencies.get(),
        removeCollaboratorUseCase: dependencies.get()),
  );
}

void _registerDatabaseDependencies() {
  //Add database to depence injection
  dependencies.registerSingletonAsync<SalesDatabase>(
    () async => $FloorSalesDatabase
        .databaseBuilder(Constants().databaseReference)
        .build(),
  );

  //Get a dao instance from the database injection
  dependencies.registerSingletonWithDependencies<CollaboratorDAO>(
      () => dependencies.get<SalesDatabase>().collaboratorDAO,
      dependsOn: [SalesDatabase]);

  dependencies.registerSingletonWithDependencies<SaleDAO>(
      () => dependencies.get<SalesDatabase>().saleDAO,
      dependsOn: [SalesDatabase]);
}

void _registerUseCaseDependencies() {
  //dependsOn await for the dashboardRepository is created to instanciante the useCase
  dependencies.registerSingletonWithDependencies<IGetCollaboratorsUseCase>(
      () => GetCollaboratorsUseCase(repository: dependencies.get()),
      dependsOn: [IDashboardRepository]);

  dependencies.registerSingletonWithDependencies<IAddCollaboratorsUseCase>(
      () => AddCollaboratorsUseCase(repository: dependencies.get()),
      dependsOn: [IDashboardRepository]);

  dependencies.registerSingletonWithDependencies<IRemoveCollaboratorUseCase>(
      () => RemoveCollaboratorUseCase(repository: dependencies.get()),
      dependsOn: [IDashboardRepository]);
}

void _registerRepositoryDependencies() {
  dependencies.registerSingletonWithDependencies<IDashboardRepository>(
      () => DashboardRepository(
            collaboratorDAO: dependencies.get(),
          ),
      dependsOn: [SalesDatabase, CollaboratorDAO]);
}
