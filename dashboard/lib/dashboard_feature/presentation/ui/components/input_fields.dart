import 'package:commons/commons.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/dashboard_collaborator_model.dart';
import '../../constants/dashboard_strings.dart';

class InputFieldsWidget extends StatefulWidget {
  final Function(DashboardCollaboratorModel collaborator) collaboratorIncluded;

  const InputFieldsWidget({super.key, required this.collaboratorIncluded});

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
          margin: const EdgeInsets.only(
            top: 8,
            left: 16,
            right: 16,
            bottom: 16,
          ),
          child: Image.asset(
            AppImages.icCollaborators,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Text(
            DashboardStrings.inputFieldsTitle,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: 8,
          ),
          child: MainTextInputWidget(
            controller: _nameController,
            inputType: TextInputType.text,
            hint: DashboardStrings.collaboratorNamePlaceholder,
            onSubmitted: (value) {
              _verifyFields();
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: MainTextInputWidget(
            controller: _titleController,
            inputType: TextInputType.text,
            hint: DashboardStrings.collaboratorDescPlaceholder,
            onSubmitted: ((_) {
              _verifyFields();
            }),
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(
            top: 8,
            left: 16,
            right: 16,
            bottom: 32,
          ),
          child: MainButtonWidget(
            buttonClicked: _verifyFields,
            buttonText: DashboardStrings.addButtonText,
          ),
        ),
      ]),
    );
  }
}
