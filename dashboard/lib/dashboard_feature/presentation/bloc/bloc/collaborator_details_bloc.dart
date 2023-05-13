import 'package:dashboard/dashboard_feature/domain/usecase/get_collaborator_by_id_use_case.dart';
import 'package:dashboard/dashboard_feature/presentation/bloc/event/collaborator_details_bloc_event.dart';
import 'package:dashboard/dashboard_feature/presentation/bloc/state/collaborator_details_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CollaboratorDetailsBloc
    extends Bloc<CollaboratorDetailsBlocEvent, CollaboratorDetailsBlocState> {
  final IGetCollaboratorByIdUseCase _getCollaboratorByIdUseCase;

  CollaboratorDetailsBloc(
    this._getCollaboratorByIdUseCase,
  ) : super(LoadingCollaboratorState()) {
    on<GetCollaboratorBlocEvent>(_getCollaboratorById);
  }

  Future<void> _getCollaboratorById(
    GetCollaboratorBlocEvent event,
    Emitter<CollaboratorDetailsBlocState> emmitter,
  ) async {
    emmitter(LoadingCollaboratorState());
    try {
      final response = await _getCollaboratorByIdUseCase.execute(event.id);
      emmitter(SuccessCollaboratorState(collaboratorModel: response));
    } catch (e) {
      emmitter(ErrorCollaboratorState());
    }
  }
}
