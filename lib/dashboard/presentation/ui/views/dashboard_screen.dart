import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';
import 'package:today_sale/commons/database/entitys/collaborator.dart';
import 'package:today_sale/dashboard/presentation/viewmodel/dashboard_collaborators_viewmodel.dart';
import 'package:today_sale/dashboard/presentation/ui/components/collaborators_list_widget.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Widget _body = const CircularProgressIndicator();
  DashboardCollaboratorsViewModel dashboardCubit = GetIt.I.get();

  void _addCollaborator() {
    dashboardCubit.addColaborator("joao").then((value) {
      _loadScreen();
      setState(() {});
    });
  }

  void _removeCollaborator(Collaborator collaborator) {
    dashboardCubit.removeCollaborator(collaborator).then((value) {
      _loadScreen();
      setState(() {});
    });
  }

  void _showAddCollaboratorBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return GestureDetector(
            onTap: (() {}),
            child: Container(
              height: 400,
              decoration: BoxDecoration(color: Colors.amber),
            ),
          );
        });
  }

  @override
  void initState() {
    _loadDatabase();
    super.initState();
  }

  void _loadDatabase() {
    _loadScreen();
    setState(() {});
  }

  void _loadScreen() {
    _body = Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<List<Collaborator>>(
              future: dashboardCubit.getCollaborators(),
              builder: (context, snapshot) {
                Widget child = Container();
                if (snapshot.hasData) {
                  child = snapshot.data != null
                      ? CollaboratorsList(
                          collaboratorList: snapshot.data!,
                          removeClicked: (collaborator) {
                            _removeCollaborator(collaborator);
                          },
                        )
                      : Container();
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                } else {
                  child = const CircularProgressIndicator();
                }
                return child;
              },
            ),
            ElevatedButton(
              onPressed: () {
                _showAddCollaboratorBottomSheet(context);
              },
              child: Text("add"),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _body;
  }
}
