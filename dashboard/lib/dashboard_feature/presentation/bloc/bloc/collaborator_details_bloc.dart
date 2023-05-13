import 'package:dashboard/dashboard_feature/presentation/bloc/event/collaborator_details_bloc_event.dart';
import 'package:dashboard/dashboard_feature/presentation/bloc/state/collaborator_details_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CollaboratorDetailsBloc
    extends Bloc<CollaboratorDetailsBlocEvent, CollaboratorDetailsBlocState> {
  CollaboratorDetailsBloc() : super(LoadingCollaboratorState()) {
    on<GetCollaboratorBlocEvent>(_getCollaboratorById);
  }

  Future<void> _getCollaboratorById(
    GetCollaboratorBlocEvent event,
    Emitter<CollaboratorDetailsBlocState> emmitter,
  ) async {
    emmitter(LoadingCollaboratorState());
  }
}
