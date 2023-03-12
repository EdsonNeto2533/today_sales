import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:today_sale/commons/components/main_button.dart';
import '../../../../../core/lib/database/entitys/collaborator.dart';
import 'package:today_sale/dashboard/presentation/constants/dashboard_strings.dart';

class InputFieldsWidget extends StatefulWidget {
  Function(Collaborator collaborator) collaboratorIncluded;

  InputFieldsWidget({super.key, required this.collaboratorIncluded});

  @override
  State<InputFieldsWidget> createState() => _InputFieldsWidgetState();
}

class _InputFieldsWidgetState extends State<InputFieldsWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  void _verifyFields() {
    if (_titleController.text.isNotEmpty && _nameController.text.isNotEmpty) {
      widget.collaboratorIncluded.call(
        Collaborator(
            name: _nameController.text, description: _titleController.text),
      );
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
            DashboardStrings.inputFieldsTitle,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: TextField(
            controller: _nameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                labelText: DashboardStrings.collaboratorNamePlaceholder),
            onSubmitted: (value) {
              _verifyFields();
            },
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: TextField(
            controller: _titleController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                labelText: DashboardStrings.collaboratorDescPlaceholder),
            onSubmitted: ((_) {
              _verifyFields();
            }),
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
