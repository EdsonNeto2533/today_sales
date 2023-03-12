library core;

import 'package:core/di/binds/core_binds.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    ...CoreBinds.databaseBinds,
  ];

  @override
  List<ModularRoute> get routes => [];
}
