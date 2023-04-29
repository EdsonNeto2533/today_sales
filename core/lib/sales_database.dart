import 'package:core/database/typeconverters/DateTimeTypeConverter.dart';
import 'package:floor/floor.dart';
import 'database/dao/collaborator_dao.dart';
import 'database/dao/sale_dao.dart';
import 'database/entitys/collaborator.dart';
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'database/entitys/sale.dart';
part 'sales_database.g.dart';

@TypeConverters([DateTimeTypeConverter])
@Database(
  version: 1,
  entities: [Collaborator, Sale],
)
abstract class SalesDatabase extends FloorDatabase {
  CollaboratorDAO get collaboratorDAO;
  SaleDAO get saleDAO;
}

//flutter packages pub run build_runner build
