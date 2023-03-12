import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:today_sale/commons/components/main_button.dart';
import 'package:today_sale/dashboard/presentation/constants/dashboard_strings.dart';

class SalesFieldsWidget extends StatefulWidget {
  Function(Sale sale) saleIncluded;
  Collaborator collaborator;

  SalesFieldsWidget(
      {super.key, required this.saleIncluded, required this.collaborator});

  @override
  State<SalesFieldsWidget> createState() => _SalesFieldsWidgetState();
}

class _SalesFieldsWidgetState extends State<SalesFieldsWidget> {
  final TextEditingController _saleValueController = TextEditingController();

  void _verifyFields() {
    if (_saleValueController.text.isNotEmpty) {
      String value = _saleValueController.text.replaceAll(",", ".");
      widget.saleIncluded.call(Sale(
        collaboratorId: widget.collaborator.id!,
        value: double.parse(value),
      ));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            DashboardStrings.collaboratorSaleText(widget.collaborator.name),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: TextField(
            controller: _saleValueController,
            keyboardType: TextInputType.number,
            decoration:
                InputDecoration(labelText: DashboardStrings.salePlaceholder),
            onSubmitted: (value) {
              _verifyFields();
            },
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: MainButtonWidget(
              buttonClicked: _verifyFields,
              buttonText: DashboardStrings.addButtonText),
        ),
      ]),
    );
  }
}
