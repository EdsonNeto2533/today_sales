import 'package:commons/commons.dart';
import 'package:dashboard/dashboard_feature/domain/model/sale_with_month_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SalesBarChartWidget extends StatefulWidget {
  final List<SaleWithMonthModel> salesList;
  const SalesBarChartWidget({
    super.key,
    required this.salesList,
  });

  @override
  State<SalesBarChartWidget> createState() => _SalesBarChartWidgetState();
}

class _SalesBarChartWidgetState extends State<SalesBarChartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 32,
        top: 16,
      ),
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: BarChart(
        BarChartData(
          titlesData: getTitlesData(),
          barGroups: getColumns(),
        ),
      ),
    );
  }

  List<BarChartGroupData> getColumns() {
    int counter = 0;
    List<BarChartGroupData> alo = [];
    for (var element in widget.salesList) {
      alo.add(
        BarChartGroupData(
          x: counter,
          barRods: [
            BarChartRodData(
              toY: element.getNumberOfSales().toDouble(),
              color: ManageUTheme.primaryColor,
            ),
          ],
        ),
      );
      counter++;
    }
    return alo;
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = widget.salesList.map((e) => e.month).toList();

    final Widget text = Text(
      titles[value.toInt()].substring(0, 3),
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  FlTitlesData getTitlesData() {
    return FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: bottomTitles,
          reservedSize: 42,
        ),
      ),
      leftTitles: AxisTitles(
        axisNameWidget: const Text("Vendas"),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
    );
  }
}
