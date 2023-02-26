import 'package:floor/floor.dart';
import 'package:today_sale/commons/database/dao/collaborator_dao.dart';
import 'package:today_sale/commons/database/dao/sale_dao.dart';
import 'package:today_sale/commons/database/entitys/collaborator.dart';
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:today_sale/commons/database/entitys/sale.dart';
part 'sales_database.g.dart';

@Database(
  version: 1,
  entities: [Collaborator, Sale],
)
abstract class SalesDatabase extends FloorDatabase {
  CollaboratorDAO get collaboratorDAO;
  SaleDAO get saleDAO;
}

//flutter packages pub run build_runner build
