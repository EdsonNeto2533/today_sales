import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';
import 'package:today_sale/commons/database/entitys/collaborator.dart';
import 'package:today_sale/dashboard/presentation/cubit/dashboard_collaborators_cubit.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  Future<List<Collaborator>> alo() async {
    await GetIt.I.allReady();
    DashboardCollaboratorsCubit dashboardCubit = GetIt.I.get();
    return dashboardCubit.getCollaborators();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder<List<Collaborator>>(
            future: alo(),
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
          )
        ],
      ),
    );
  }
}
