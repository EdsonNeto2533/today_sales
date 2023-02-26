import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';
import 'package:today_sale/commons/components/app_bar.dart';
import 'package:today_sale/commons/database/entitys/collaborator.dart';
import 'package:today_sale/commons/utils/constants/app_images.dart';
import 'package:today_sale/commons/utils/interfaces/ui_state.dart';
import 'package:today_sale/dashboard/presentation/ui/components/input_fields.dart';
import 'package:today_sale/dashboard/presentation/viewmodel/dashboard_collaborators_viewmodel.dart';
import 'package:today_sale/dashboard/presentation/ui/components/collaborators_list_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DashboardCollaboratorsViewModel dashboardViewModel = GetIt.I.get();

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
                removeClicked: (collaborator) {
                  _removeCollaborator(collaborator);
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
        builder: (context) {
          return GestureDetector(
            onTap: (() {}),
            child: InputFieldsWidget(
              collaboratorIncluded: _addCollaborator,
            ),
          );
        });
  }
}
