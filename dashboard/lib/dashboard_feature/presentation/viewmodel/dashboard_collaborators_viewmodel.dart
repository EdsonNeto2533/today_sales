import 'package:commons/utils/interfaces/ui_state.dart';
import 'package:core/database/entitys/collaborator.dart';
import 'package:core/database/entitys/sale.dart';
import 'package:dashboard/dashboard_feature/domain/usecase/add_sale_use_case.dart';
import 'package:flutter/widgets.dart';

import '../usecase/iadd_collaborators_use_case.dart';
import '../usecase/iget_collaborators_use_case.dart';
import '../usecase/iremove_colaborator_use_case.dart';

class DashboardCollaboratorsViewModel {
  final IGetCollaboratorsUseCase _getCollaboratorsUseCase;
  final IAddCollaboratorsUseCase _addColaboratorsUseCase;
  final IRemoveCollaboratorUseCase _removeCollaboratorUseCase;
  final IAddSaleUseCase _addSaleUseCase;

  ValueNotifier<UIState<List<Collaborator>>> collaboratorListState =
      ValueNotifier(LoadingUIState());

  DashboardCollaboratorsViewModel({
    required IGetCollaboratorsUseCase getCollaboratorsUseCase,
    required IAddCollaboratorsUseCase addColaboratorsUseCase,
    required IRemoveCollaboratorUseCase removeCollaboratorUseCase,
    required IAddSaleUseCase addSaleUseCase,
  })  : _addColaboratorsUseCase = addColaboratorsUseCase,
        _getCollaboratorsUseCase = getCollaboratorsUseCase,
        _removeCollaboratorUseCase = removeCollaboratorUseCase,
        _addSaleUseCase = addSaleUseCase;

  void getCollaborators() async {
    collaboratorListState.value = LoadingUIState();
    try {
      var collaboratorList = await _getCollaboratorsUseCase.getCollaborators();
      collaboratorListState.value = SuccessUIState(collaboratorList);
    } catch (e) {
      collaboratorListState.value = FailureUIstate(e.toString());
    }
  }

  void addColaborator(Collaborator collaborator) async {
    try {
      await _addColaboratorsUseCase.addCollaborator(collaborator);
      getCollaborators();
    } catch (e) {
      collaboratorListState.value = FailureUIstate(e.toString());
    }
  }

  void removeCollaborator(Collaborator collaborator) async {
    try {
      await _removeCollaboratorUseCase.removeColaborator(collaborator);
      getCollaborators();
    } catch (e) {
      collaboratorListState.value = FailureUIstate(e.toString());
    }
  }

  void addSale(Sale sale) async {
    try {
      await _addSaleUseCase.execute(sale);
      getCollaborators();
    } catch (e) {
      collaboratorListState.value = FailureUIstate(e.toString());
    }
  }
}
