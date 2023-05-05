import 'package:dashboard/dashboard_feature/domain/usecase/add_sale_use_case.dart';
import 'package:dashboard/dashboard_feature/presentation/bloc/event/dashboard_bloc_event.dart';
import 'package:dashboard/dashboard_feature/presentation/bloc/state/dashboard_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../usecase/iadd_collaborators_use_case.dart';
import '../../usecase/iget_collaborators_use_case.dart';
import '../../usecase/iremove_colaborator_use_case.dart';

class DashboardCollaboratorsBloc
    extends Bloc<DashboardBlocEvent, DashboardBlocState> {
  final IGetCollaboratorsUseCase _getCollaboratorsUseCase;
  final IAddCollaboratorsUseCase _addColaboratorsUseCase;
  final IRemoveCollaboratorUseCase _removeCollaboratorUseCase;
  final IAddSaleUseCase _addSaleUseCase;

  DashboardCollaboratorsBloc({
    required IGetCollaboratorsUseCase getCollaboratorsUseCase,
    required IAddCollaboratorsUseCase addColaboratorsUseCase,
    required IRemoveCollaboratorUseCase removeCollaboratorUseCase,
    required IAddSaleUseCase addSaleUseCase,
  })  : _addColaboratorsUseCase = addColaboratorsUseCase,
        _getCollaboratorsUseCase = getCollaboratorsUseCase,
        _removeCollaboratorUseCase = removeCollaboratorUseCase,
        _addSaleUseCase = addSaleUseCase,
        super(const LoadingDashboardBlocState()) {
    on<GetAllCollaboratosBlocEvent>(_getCollaborators);
    on<AddCollaboratoBlocEvent>(_addColaborator);
    on<RemoveCollaboratoBlocEvent>(_removeCollaborator);
    on<AddSaleBlocEvent>(_addSale);
  }

  Future<void> _getCollaborators(
    GetAllCollaboratosBlocEvent event,
    Emitter<DashboardBlocState> emitter,
  ) async {
    emitter(const LoadingDashboardBlocState());
    try {
      var collaboratorList = await _getCollaboratorsUseCase.getCollaborators();
      emitter(SuccessBlocState(collaboratorList));
    } catch (e) {
      emitter(ErrorDashboardBlocState(e.toString()));
    }
  }

  Future<void> _addColaborator(
    AddCollaboratoBlocEvent event,
    Emitter<DashboardBlocState> emitter,
  ) async {
    try {
      await _addColaboratorsUseCase.addCollaborator(event.collaborator);
      add(const GetAllCollaboratosBlocEvent());
    } catch (e) {
      emitter(ErrorDashboardBlocState(e.toString()));
    }
  }

  Future<void> _removeCollaborator(
    RemoveCollaboratoBlocEvent event,
    Emitter<DashboardBlocState> emitter,
  ) async {
    try {
      await _removeCollaboratorUseCase.removeColaborator(event.collaborator);
      add(const GetAllCollaboratosBlocEvent());
    } catch (e) {
      emitter(ErrorDashboardBlocState(e.toString()));
    }
  }

  Future<void> _addSale(
    AddSaleBlocEvent event,
    Emitter<DashboardBlocState> emitter,
  ) async {
    try {
      await _addSaleUseCase.execute(event.sale);
      add(const GetAllCollaboratosBlocEvent());
    } catch (e) {
      emitter(ErrorDashboardBlocState(e.toString()));
    }
  }
}
