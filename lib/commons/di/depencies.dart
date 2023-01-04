import 'package:get_it/get_it.dart';

final dependencies = GetIt.instance;

void registerDepencies() {
  _registerDatabaseDependencies();
  _registerRepositoryDependencies();
  _registerUseCaseDependencies();
}

void _registerDatabaseDependencies() {
  // dependencies.registerLazySingletonAsync(() =>
  // await FloorAppDatabase.databaseBuilder('app_database.db').build());
}

void _registerUseCaseDependencies() {}

void _registerRepositoryDependencies() {}
