import 'package:dashboard/dashboard_feature/presentation/bloc/bloc/dashboard_collaborators_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

List<Bind> viewModelBinds = [
  Bind.factory(
    (i) => DashboardCollaboratorsBloc(
      getCollaboratorsUseCase: i.get(),
      addColaboratorsUseCase: i.get(),
      removeCollaboratorUseCase: i.get(),
      addSaleUseCase: i.get(),
    ),
  )
];
