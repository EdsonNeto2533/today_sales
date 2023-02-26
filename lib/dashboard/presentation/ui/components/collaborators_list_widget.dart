import 'package:flutter/material.dart';
import 'package:today_sale/commons/database/entitys/collaborator.dart';
import 'package:today_sale/commons/utils/constants/app_images.dart';

class CollaboratorsList extends StatelessWidget {
  List<Collaborator> collaboratorList;
  final Function(Collaborator) removeClicked;
  final Function(Collaborator) addSaleClicked;

  CollaboratorsList(
      {Key? key,
      required this.collaboratorList,
      required this.removeClicked,
      required this.addSaleClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
              child: ListTile(
                title: Text(collaboratorList[index].name),
                subtitle: Text(collaboratorList[index].description),
                leading: CircleAvatar(
                  child: Image.asset(AppImages.ic_add_user),
                ),
                trailing: Wrap(
                  children: [
                    IconButton(
                      onPressed: () {
                        removeClicked.call(collaboratorList[index]);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        addSaleClicked.call(collaboratorList[index]);
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
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


//h u y
