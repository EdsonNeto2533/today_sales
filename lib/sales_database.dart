import 'package:floor/floor.dart';
import 'package:today_sale/commons/database/dao/collaborator_dao.dart';
import 'package:today_sale/commons/database/entitys/collaborator.dart';
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'sales_database.g.dart';

@Database(
  version: 1,
  entities: [Collaborator],
)
abstract class SalesDatabase extends FloorDatabase {
  CollaboratorDAO get collaboratorDAO;
}
