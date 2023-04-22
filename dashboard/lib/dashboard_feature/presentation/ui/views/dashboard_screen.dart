import 'package:commons/components/app_bar.dart';
import 'package:commons/utils/constants/app_images.dart';
import 'package:commons/utils/interfaces/ui_state.dart';
import 'package:core/database/entitys/collaborator.dart';
import 'package:dashboard/dashboard_feature/presentation/bloc/event/dashboard_bloc_event.dart';
import 'package:dashboard/dashboard_feature/presentation/bloc/state/dashboard_bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../bloc/bloc/dashboard_collaborators_bloc.dart';
import '../components/collaborators_list_widget.dart';
import '../components/input_fields.dart';
import '../components/sales_input_fields.dart';

class DashboardScreen extends StatefulWidget {
  DashboardCollaboratorsBloc dashboardBloc;
  DashboardScreen({Key? key, required this.dashboardBloc}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    widget.dashboardBloc.add(const GetAllCollaboratosBlocEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ManageUAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          _showAddCollaboratorBottomSheet(context);
        }),
        child: Image.asset(AppImages.ic_add_user),
      ),
      body: BlocBuilder(
        bloc: widget.dashboardBloc,
        builder: (context, DashboardBlocState value) {
          DashboardBlocState state = value;

          if (state is SuccessBlocState) {
            return Container(
              margin: const EdgeInsets.only(top: 32),
              child: CollaboratorsList(
                collaboratorList: state.collaborators,
                removeClicked: _removeCollaborator,
                addSaleClicked: (collaborator) {
                  _showAddSaleBottomSheet(context, collaborator);
                },
              ),
            );
          }

          if (state is LoadingDashboardBlocState) {
            return const CircularProgressIndicator();
          }

          if (state is ErrorDashboardBlocState) {
            print(state);
          }

          return Container();
        },
      ),
    );
  }

  void _addCollaborator(Collaborator collaborator) {
    widget.dashboardBloc.add(AddCollaboratoBlocEvent(collaborator));
  }

  void _removeCollaborator(Collaborator collaborator) {
    widget.dashboardBloc.add(RemoveCollaboratoBlocEvent(collaborator));
  }

  void _showAddCollaboratorBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Wrap(
            children: [
              GestureDetector(
                onTap: (() {}),
                child: InputFieldsWidget(
                  collaboratorIncluded: _addCollaborator,
                ),
              ),
            ],
          );
        });
  }

  void _showAddSaleBottomSheet(
      BuildContext context, Collaborator collaborator) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Wrap(
          children: [
            GestureDetector(
              onTap: (() {}),
              child: SalesFieldsWidget(
                collaborator: collaborator,
                saleIncluded: (sale) {
                  widget.dashboardBloc.add(AddSaleBlocEvent(sale));
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
