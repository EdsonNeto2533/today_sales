import 'package:commons/commons.dart';
import 'package:dashboard/dashboard_feature/domain/model/dashboard_collaborator_model.dart';
import 'package:flutter/material.dart';

class CollaboratorItemWidget extends StatefulWidget {
  const CollaboratorItemWidget({
    super.key,
    required this.collaborator,
    required this.addSaleClicked,
    required this.removeClicked,
  });
  final DashboardCollaboratorModel collaborator;
  final Function(DashboardCollaboratorModel) removeClicked;
  final Function(DashboardCollaboratorModel) addSaleClicked;

  @override
  State<CollaboratorItemWidget> createState() => _CollaboratorItemWidgetState();
}

class _CollaboratorItemWidgetState extends State<CollaboratorItemWidget> {
  bool _isExpanded = false;

  double get saleAmout {
    double value = 0.0;
    for (var element in widget.collaborator.sales) {
      value += element.value;
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: ExpansionPanelList(
        expansionCallback: (panelIndex, isExpanded) {
          setState(
            () {
              _isExpanded = !_isExpanded;
            },
          );
        },
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(
                  widget.collaborator.name.toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(widget.collaborator.description),
                leading: Image.asset(AppImages.ic_collaborators),
              );
            },
            body: Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text("total vendas: $saleAmout"),
                  IconButton(
                    onPressed: () {
                      widget.removeClicked.call(widget.collaborator);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      widget.addSaleClicked.call(widget.collaborator);
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            isExpanded: _isExpanded,
          ),
        ],
      ),
    );
  }
}
