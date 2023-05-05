import 'package:commons/components/main_button.dart';
import 'package:core/database/entitys/collaborator.dart';
import 'package:core/database/entitys/sale.dart';
import 'package:flutter/material.dart';

import '../../constants/dashboard_strings.dart';

class SalesFieldsWidget extends StatefulWidget {
  final Function(Sale sale) saleIncluded;
  final Collaborator collaborator;

  const SalesFieldsWidget({
    super.key,
    required this.saleIncluded,
    required this.collaborator,
  });

  @override
  State<SalesFieldsWidget> createState() => _SalesFieldsWidgetState();
}

class _SalesFieldsWidgetState extends State<SalesFieldsWidget> {
  final TextEditingController _saleValueController = TextEditingController();
  DateTime? _selectedDate;

  String get _selectedDateText => _selectedDate != null
      ? "Data selecionada: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
      : "Data não selecionada";

  void _verifyFields() {
    if (_saleValueController.text.isNotEmpty && _selectedDate != null) {
      String value = _saleValueController.text.replaceAll(",", ".");
      widget.saleIncluded.call(
        Sale(
          collaboratorId: widget.collaborator.id!,
          value: double.parse(value),
          saleDate: _selectedDate!,
        ),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: Text(
              DashboardStrings.collaboratorSaleText(
                widget.collaborator.name,
              ),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: TextField(
              controller: _saleValueController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: DashboardStrings.salePlaceholder,
              ),
              onSubmitted: (value) {
                _verifyFields();
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_selectedDateText),
                MainButtonWidget(
                  buttonClicked: _showDatePick,
                  buttonText: "Data da venda",
                ),
              ],
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
        ],
      ),
    );
  }

  void _showDatePick() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((datePicked) {
      if (datePicked == null) {
        return;
      }
      setState(() {
        _selectedDate = datePicked;
      });
    });
  }
}
