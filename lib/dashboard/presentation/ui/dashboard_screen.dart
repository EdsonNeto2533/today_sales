import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';
import 'package:today_sale/commons/database/entitys/collaborator.dart';
import 'package:today_sale/dashboard/presentation/cubit/dashboard_collaborators_cubit.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Widget _body = CircularProgressIndicator();
  Future<void> _initData() async {
    await GetIt.I.allReady();
    dashboardCubit = GetIt.I.get();
  }

  void _addCollaborator() {
    dashboardCubit?.addColaborator().then((value) {
      _loadScreen();
      setState(() {});
    });
  }

  @override
  void initState() {
    _loadDatabase();
    super.initState();
  }

  DashboardCollaboratorsCubit? dashboardCubit;

  void _loadDatabase() {
    _initData().then((value) {
      _loadScreen();
      setState(() {});
    });
  }

  void _loadScreen() {
    _body = Scaffold(
      body: Column(
        children: [
          FutureBuilder<List<Collaborator>>(
            future: dashboardCubit?.getCollaborators(),
            builder: (context, snapshot) {
              List<Widget> children = [];
              if (snapshot.hasData) {
                print(snapshot.data);
                children.add(Text("deu boa"));
              } else if (snapshot.hasError) {
                print(snapshot.error);
                children.add(Text("deu ruim"));
              } else {
                print(snapshot.data);
                children.add(Text("carregando"));
              }
              return Container(
                margin: EdgeInsets.only(top: 44),
                child: Column(children: children),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              _addCollaborator();
            },
            child: Text("add"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _body;
  }
}
