import 'package:get_it/get_it.dart';
import 'package:today_sale/commons/database/dao/collaborator_dao.dart';
import 'package:today_sale/commons/utils/constants/app_constants.dart';
import 'package:today_sale/dashboard/data/repository/dashboard_repository.dart';
import 'package:today_sale/dashboard/domain/repository/idashboard_repository.dart';
import 'package:today_sale/dashboard/domain/usecase/add_colaborator_use_case.dart';
import 'package:today_sale/dashboard/domain/usecase/get_colaborators_use_case.dart';
import 'package:today_sale/dashboard/presentation/cubit/dashboard_collaborators_cubit.dart';
import 'package:today_sale/dashboard/presentation/usecase/iadd_colaborators_use_case.dart';
import 'package:today_sale/dashboard/presentation/usecase/iget_colaborators_use_case.dart';
import 'package:today_sale/sales_database.dart';

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
        addColaboratorsUseCase: dependencies.get()),
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
}

void _registerUseCaseDependencies() {
  dependencies.registerSingletonWithDependencies<IGetColaboratorsUseCase>(
      () => GetColaboratorsUseCase(repository: dependencies.get()),
      dependsOn: [IDashboardRepository]);
  dependencies.registerSingletonWithDependencies<IAddColaboratorsUseCase>(
      () => AddColaboratorsUseCase(repository: dependencies.get()),
      dependsOn: [IDashboardRepository]);
}

void _registerRepositoryDependencies() {
  dependencies.registerSingletonWithDependencies<IDashboardRepository>(
      () => DashboardRepository(
            collaboratorDAO: dependencies.get(),
          ),
      dependsOn: [SalesDatabase, CollaboratorDAO]);
}
