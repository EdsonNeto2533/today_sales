import 'package:commons/components/main_button.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/dashboard_collaborator_model.dart';
import '../../constants/dashboard_strings.dart';

class InputFieldsWidget extends StatefulWidget {
  Function(DashboardCollaboratorModel collaborator) collaboratorIncluded;

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
        DashboardCollaboratorModel(
          name: _nameController.text,
          description: _titleController.text,
          sales: [],
        ),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            DashboardStrings.inputFieldsTitle,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: MainButtonWidget(
            buttonClicked: _verifyFields,
            buttonText: DashboardStrings.addButtonText,
          ),
        ),
      ]),
    );
  }
}
