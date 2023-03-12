import 'package:commons/components/app_bar.dart';
import 'package:commons/utils/constants/app_images.dart';
import 'package:commons/utils/interfaces/ui_state.dart';
import 'package:core/database/entitys/collaborator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../viewmodel/dashboard_collaborators_viewmodel.dart';
import '../components/collaborators_list_widget.dart';
import '../components/input_fields.dart';
import '../components/sales_input_fields.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DashboardCollaboratorsViewModel dashboardViewModel = Modular.get();

  @override
  void initState() {
    super.initState();
    dashboardViewModel.getCollaborators();
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
      body: ValueListenableBuilder(
        valueListenable: dashboardViewModel.collaboratorListState,
        builder: (
          BuildContext context,
          UIState<List<Collaborator>> value,
          Widget? child,
        ) {
          UIState<List<Collaborator>> state = value;

          if (state is SuccessUIState) {
            return Container(
              margin: const EdgeInsets.only(top: 32),
              child: CollaboratorsList(
                collaboratorList: (state as SuccessUIState).value,
                removeClicked: _removeCollaborator,
                addSaleClicked: (collaborator) {
                  _showAddSaleBottomSheet(context, collaborator);
                },
              ),
            );
          }

          if (state is LoadingUIState) {
            return CircularProgressIndicator();
          }

          if (state is FailureUIstate) {
            print(state);
          }

          return Container();
        },
      ),
    );
  }

  void _addCollaborator(Collaborator collaborator) {
    dashboardViewModel.addColaborator(collaborator);
  }

  void _removeCollaborator(Collaborator collaborator) {
    dashboardViewModel.removeCollaborator(collaborator);
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
                saleIncluded: (sale) {},
              ),
            ),
          ],
        );
      },
    );
  }
}
