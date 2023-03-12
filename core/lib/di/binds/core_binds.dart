import 'package:core/database/dao/collaborator_dao.dart';
import 'package:core/database/dao/sale_dao.dart';
import 'package:core/sales_database.dart';
import 'package:core/utils/constants/core_constants.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreBinds {
  static final List<Bind> databaseBinds = [
    AsyncBind(
      (i) => $FloorSalesDatabase
          .databaseBuilder(CoreConstants.databaseReference)
          .build(),
    ),
    Bind.singleton<CollaboratorDAO>(
      (i) => i.get<SalesDatabase>().collaboratorDAO,
      export: true,
    ),
    Bind.singleton<SaleDAO>(
      (i) => i.get<SalesDatabase>().saleDAO,
      export: true,
    ),
  ];
}
