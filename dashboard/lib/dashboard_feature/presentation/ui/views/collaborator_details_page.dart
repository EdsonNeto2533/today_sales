import 'package:commons/commons.dart';
import 'package:dashboard/dashboard_feature/presentation/bloc/bloc/collaborator_details_bloc.dart';
import 'package:dashboard/dashboard_feature/presentation/bloc/event/collaborator_details_bloc_event.dart';
import 'package:dashboard/dashboard_feature/presentation/bloc/state/collaborator_details_bloc_state.dart';
import 'package:dashboard/dashboard_feature/presentation/ui/components/collaborator_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CollaboratorDetailsPage extends StatefulWidget {
  final int collaboratorId;
  final CollaboratorDetailsBloc bloc = Modular.get();
  CollaboratorDetailsPage({
    super.key,
    required this.collaboratorId,
  });

  @override
  State<CollaboratorDetailsPage> createState() =>
      _CollaboratorDetailsPageState();
}

class _CollaboratorDetailsPageState extends State<CollaboratorDetailsPage> {
  @override
  void initState() {
    super.initState();
    _getCollaboratorInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ManageUAppBar(),
      body: BlocBuilder(
        bloc: widget.bloc,
        builder: (_, state) {
          if (state is LoadingCollaboratorState) {
            return const CircularProgressIndicator();
          }

          if (state is ErrorCollaboratorState) {
            return ErrorPage(retryClicked: _getCollaboratorInfo);
          }

          if (state is SuccessCollaboratorState) {
            return CollaboratorDetailsWidget(
              collaboratorModel: state.collaboratorModel,
            );
          }
          return Container();
        },
      ),
    );
  }

  void _getCollaboratorInfo() {
    widget.bloc.add(GetCollaboratorBlocEvent(id: widget.collaboratorId));
  }
}
