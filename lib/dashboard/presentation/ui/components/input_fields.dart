import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:today_sale/commons/database/entitys/collaborator.dart';

class InputFieldsWidget extends StatefulWidget {
  Function(Collaborator collaborator) collaboratorIncluded;

  InputFieldsWidget({super.key, required this.collaboratorIncluded});

  @override
  State<InputFieldsWidget> createState() => _InputFieldsWidgetState();
}

class _InputFieldsWidgetState extends State<InputFieldsWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//h u 
