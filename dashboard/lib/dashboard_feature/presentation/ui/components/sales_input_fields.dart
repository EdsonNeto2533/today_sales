import 'package:commons/commons.dart';
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

  String get _selectedDateText =>
      DashboardStrings.selectedDateText(_selectedDate);

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
            margin: const EdgeInsets.only(
              top: 8,
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: Image.asset(
              AppImages.icCoin,
              color: Colors.black,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              DashboardStrings.collaboratorSaleText(
                widget.collaborator.name,
              ),
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: MainTextInputWidget(
              controller: _saleValueController,
              inputType: TextInputType.number,
              hint: DashboardStrings.salePlaceholder,
              onSubmitted: (value) {
                _verifyFields();
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 24,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(_selectedDateText),
                ),
                SizedBox(
                  child: MainButtonWidget(
                    buttonClicked: _showDatePick,
                    buttonText: DashboardStrings.saleDate,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 32,
              top: 8,
            ),
            child: MainButtonWidget(
              buttonClicked: _verifyFields,
              buttonText: DashboardStrings.addButtonText.toUpperCase(),
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
