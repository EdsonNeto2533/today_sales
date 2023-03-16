import 'package:core/database/dao/collaborator_dao.dart';
import 'package:core/database/dao/sale_dao.dart';
import 'package:core/sales_database.dart';
import 'package:core/utils/constants/core_constants.dart';
import 'package:flutter_modular/flutter_modular.dart';

// class CoreBinds {
//   static final List<Bind> databaseBinds = [
//     // Bind.lazySingleton(
//     //   (i) async => await $FloorSalesDatabase
//     //       .databaseBuilder(CoreConstants.databaseReference)
//     //       .build(),
//     // ),
//     Bind.singleton<CollaboratorDAO>(
//       (i) => i.get<SalesDatabase>().collaboratorDAO,
//     ),
//     Bind.singleton<SaleDAO>(
//       (i) => i.get<SalesDatabase>().saleDAO,
//     ),
//     // AsyncBind<CollaboratorDAO>(((i) => teste.getDao()))
//   ];
// }

class DatabaseBuilder {
  static CollaboratorDAO? collaboratorDAO;
  static SaleDAO? saleDAO;

  static buildDatabase() async {
    SalesDatabase db = await $FloorSalesDatabase
        .databaseBuilder(CoreConstants.databaseReference)
        .build();
    collaboratorDAO = db.collaboratorDAO;
    saleDAO = db.saleDAO;
  }
}
