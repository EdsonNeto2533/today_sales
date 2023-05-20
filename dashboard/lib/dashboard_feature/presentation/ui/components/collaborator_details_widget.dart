import 'package:commons/commons.dart';
import 'package:dashboard/dashboard_feature/domain/model/dashboard_collaborator_model.dart';
import 'package:dashboard/dashboard_feature/domain/model/sale_with_month_model.dart';
import 'package:dashboard/dashboard_feature/presentation/ui/components/sales_bar_chart.dart';
import 'package:dashboard/dashboard_feature/presentation/ui/components/value_label_divider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

import '../../constants/dashboard_strings.dart';

class CollaboratorDetailsWidget extends StatefulWidget {
  final DashboardCollaboratorModel collaboratorModel;
  const CollaboratorDetailsWidget({
    super.key,
    required this.collaboratorModel,
  });

  @override
  State<CollaboratorDetailsWidget> createState() =>
      _CollaboratorDetailsWidgetState();
}

class _CollaboratorDetailsWidgetState extends State<CollaboratorDetailsWidget> {
  double get salesValue =>
      widget.collaboratorModel.getTotalSalesValue(selectedDate);

  List<SaleWithMonthModel> get salesByMonth =>
      widget.collaboratorModel.getSalesByMonth();

  int get saleQuantity =>
      widget.collaboratorModel.getNumberOfSales(selectedDate);

  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            Center(
              child: Image.asset(
                AppImages.icCollaborators,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
              ),
              child: Text(
                widget.collaboratorModel.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
              ),
              child: Text(
                widget.collaboratorModel.description,
                style: TextStyle(
                  fontSize: 18,
                  color: ManageUTheme.fadingGrey,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
              ),
              child: const Divider(
                height: 1,
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(
                top: 24,
                left: 16,
                right: 16,
              ),
              child: Text(
                DashboardStrings.report,
                style: TextStyle(
                  fontSize: 18,
                  color: ManageUTheme.fadingGrey,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 24,
                left: 16,
                right: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainButtonWidget(
                    buttonClicked: () {
                      showMonthPicker(
                        context: context,
                        initialDate: DateTime.now(),
                        lastDate: DateTime.now(),
                      ).then((value) {
                        setState(() {
                          selectedDate = value;
                        });
                      });
                    },
                    buttonText: "Selecionar mês",
                  ),
                  selectedDate != null
                      ? MainButtonWidget(
                          buttonClicked: () {
                            setState(() {
                              selectedDate = null;
                            });
                          },
                          buttonText: "Limpar filtro",
                        )
                      : Container(),
                ],
              ),
            ),
            ValueLabelDivider(
              label: DashboardStrings.totalSalesLabel,
              value: NumberFormat.simpleCurrency().format(salesValue),
            ),
            ValueLabelDivider(
              label: DashboardStrings.numberSalesLabel,
              value: saleQuantity.toString(),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
              ),
              child: const Divider(
                height: 1,
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(
                top: 24,
                left: 16,
                right: 16,
              ),
              child: Text(
                DashboardStrings.peformanceLabel,
                style: TextStyle(
                  fontSize: 20,
                  color: ManageUTheme.fadingGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SalesBarChartWidget(
              salesList: salesByMonth,
            ),
          ],
        ),
      ),
    );
  }
}
