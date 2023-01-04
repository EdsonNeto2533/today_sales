import 'package:get_it/get_it.dart';
import 'package:today_sale/commons/utils/constants/app_constants.dart';
import 'package:today_sale/sales_database.dart';

final dependencies = GetIt.instance;

void registerDepencies() {
  _registerDatabaseDependencies();
  _registerRepositoryDependencies();
  _registerUseCaseDependencies();
}

void _registerDatabaseDependencies() {
  dependencies.registerLazySingletonAsync(() async => await $FloorSalesDatabase
      .databaseBuilder(Constants().databaseReference)
      .build());
}

void _registerUseCaseDependencies() {}

void _registerRepositoryDependencies() {}
