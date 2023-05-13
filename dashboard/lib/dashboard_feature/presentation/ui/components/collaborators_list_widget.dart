import 'package:dashboard/dashboard_feature/domain/model/dashboard_collaborator_model.dart';
import 'package:dashboard/dashboard_feature/presentation/ui/components/collaborator_item_width_new.dart';
import 'package:flutter/material.dart';

class CollaboratorsList extends StatelessWidget {
  final List<DashboardCollaboratorModel> collaboratorList;
  final Function(DashboardCollaboratorModel) removeClicked;
  final Function(DashboardCollaboratorModel) addSaleClicked;

  const CollaboratorsList({
    Key? key,
    required this.collaboratorList,
    required this.removeClicked,
    required this.addSaleClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
            elevation: 5,
            child: CollaboratorItemWidthNew(
              collaborator: collaboratorList[index],
              addSaleClicked: addSaleClicked,
              removeClicked: removeClicked,
            ),
          );
        },
        itemCount: collaboratorList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
