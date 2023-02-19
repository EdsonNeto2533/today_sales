import 'package:flutter/material.dart';
import 'package:today_sale/commons/database/entitys/collaborator.dart';

class CollaboratorsList extends StatelessWidget {
  List<Collaborator> collaboratorList;
  final Function(Collaborator) removeClicked;

  CollaboratorsList(
      {Key? key, required this.collaboratorList, required this.removeClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            elevation: 5,
            child: ListTile(
              title: Text(collaboratorList[index].name),
              trailing: IconButton(
                onPressed: () {
                  removeClicked.call(collaboratorList[index]);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ),
          );
        },
        itemCount: collaboratorList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
