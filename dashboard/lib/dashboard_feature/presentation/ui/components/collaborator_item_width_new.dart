import 'package:commons/commons.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/dashboard_collaborator_model.dart';

class CollaboratorItemWidthNew extends StatelessWidget {
  const CollaboratorItemWidthNew({
    super.key,
    required this.collaborator,
    required this.addSaleClicked,
    required this.removeClicked,
  });
  final DashboardCollaboratorModel collaborator;
  final Function(DashboardCollaboratorModel) removeClicked;
  final Function(DashboardCollaboratorModel) addSaleClicked;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        collaborator.name.toUpperCase(),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      subtitle: Text(
        collaborator.description,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      leading: Image.asset(
        AppImages.icCollaborators,
      ),
      trailing: Wrap(
        spacing: 12,
        children: [
          IconButton(
            onPressed: () {
              removeClicked.call(collaborator);
            },
            icon: Image.asset(
              AppImages.icTrashCan,
              color: Colors.black,
            ),
          ),
          ClipOval(
            child: Material(
              color: ManageUTheme.primaryColor,
              child: InkWell(
                onTap: () => addSaleClicked.call(collaborator),
                child: const SizedBox(
                  width: 48,
                  height: 48,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          )
        ],
      ),
    );
  }
}
