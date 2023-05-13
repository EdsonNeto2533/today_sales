import 'package:commons/components/app_bar.dart';
import 'package:commons/utils/constants/app_images.dart';
import 'package:dashboard/dashboard_feature/domain/model/dashboard_collaborator_model.dart';
import 'package:dashboard/dashboard_feature/presentation/bloc/event/dashboard_bloc_event.dart';
import 'package:dashboard/dashboard_feature/presentation/bloc/state/dashboard_bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc/dashboard_collaborators_bloc.dart';
import '../components/collaborators_list_widget.dart';
import '../components/input_fields.dart';
import '../components/sales_input_fields.dart';

class DashboardScreen extends StatefulWidget {
  final DashboardCollaboratorsBloc dashboardBloc;
  const DashboardScreen({
    Key? key,
    required this.dashboardBloc,
  }) : super(key: key);

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
      appBar: const ManageUAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          _showAddCollaboratorBottomSheet();
        }),
        child: Image.asset(AppImages.icAddUser),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 48,
          ),
          Text(
            "Colaboradores".toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          BlocBuilder(
            bloc: widget.dashboardBloc,
            builder: (context, DashboardBlocState value) {
              DashboardBlocState state = value;

              if (state is SuccessBlocState) {
                return Container(
                  margin: const EdgeInsets.only(top: 32),
                  child: CollaboratorsList(
                    collaboratorList: state.collaborators,
                    removeClicked: _removeCollaborator,
                    addSaleClicked: _showAddSaleBottomSheet,
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
        ],
      ),
    );
  }

  void _addCollaborator(DashboardCollaboratorModel collaborator) {
    widget.dashboardBloc.add(AddCollaboratoBlocEvent(collaborator));
  }

  void _removeCollaborator(DashboardCollaboratorModel collaborator) {
    widget.dashboardBloc.add(
      RemoveCollaboratoBlocEvent(
        collaborator,
      ),
    );
  }

  void _showAddCollaboratorBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        backgroundColor: Colors.white,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Wrap(
              children: [
                GestureDetector(
                  onTap: (() {}),
                  child: InputFieldsWidget(
                    collaboratorIncluded: _addCollaborator,
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _showAddSaleBottomSheet(
    DashboardCollaboratorModel collaborator,
  ) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Wrap(
            children: [
              GestureDetector(
                onTap: (() {}),
                child: SalesFieldsWidget(
                  collaborator: collaborator.toEntity(),
                  saleIncluded: (sale) {
                    widget.dashboardBloc.add(AddSaleBlocEvent(sale));
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
