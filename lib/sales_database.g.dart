// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorSalesDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$SalesDatabaseBuilder databaseBuilder(String name) =>
      _$SalesDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$SalesDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$SalesDatabaseBuilder(null);
}

class _$SalesDatabaseBuilder {
  _$SalesDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$SalesDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$SalesDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<SalesDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$SalesDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$SalesDatabase extends SalesDatabase {
  _$SalesDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CollaboratorDAO? _collaboratorDAOInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Collaborator` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CollaboratorDAO get collaboratorDAO {
    return _collaboratorDAOInstance ??=
        _$CollaboratorDAO(database, changeListener);
  }
}

class _$CollaboratorDAO extends CollaboratorDAO {
  _$CollaboratorDAO(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _collaboratorInsertionAdapter = InsertionAdapter(
            database,
            'Collaborator',
            (Collaborator item) =>
                <String, Object?>{'id': item.id, 'name': item.name}),
        _collaboratorDeletionAdapter = DeletionAdapter(
            database,
            'Collaborator',
            ['id'],
            (Collaborator item) =>
                <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Collaborator> _collaboratorInsertionAdapter;

  final DeletionAdapter<Collaborator> _collaboratorDeletionAdapter;

  @override
  Future<List<Collaborator>> getCollaborators() async {
    return _queryAdapter.queryList('select * from Collaborator',
        mapper: (Map<String, Object?> row) =>
            Collaborator(id: row['id'] as int, name: row['name'] as String));
  }

  @override
  Future<Collaborator?> getCollaboratorById(int collaboratorId) async {
    return _queryAdapter.query('select * from Collaborator where id = ?1',
        mapper: (Map<String, Object?> row) =>
            Collaborator(id: row['id'] as int, name: row['name'] as String),
        arguments: [collaboratorId]);
  }

  @override
  Future<void> insertCollaborator(Collaborator collaborator) async {
    await _collaboratorInsertionAdapter.insert(
        collaborator, OnConflictStrategy.abort);
  }

  @override
  Future<void> removeCollaborator(Collaborator collaborator) async {
    await _collaboratorDeletionAdapter.delete(collaborator);
  }
}
