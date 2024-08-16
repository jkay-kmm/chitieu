import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyChart extends StatefulWidget {

  final List<Expense> expenses;
  const MyChart({super.key, required this.expenses});


  @override
  State<MyChart> createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('Labour', 10,const  Color(0xFF00C9A7)), // Green
      _ChartData('Legal', 8,const  Color(0xFF333333)), // Black
      _ChartData('Production', 7, const Color(0xFF0066CC)), // Blue
      _ChartData('License', 5,const  Color(0xFFFF6699)), // Pink
      _ChartData('Facilities', 10, const Color(0xFFFFCC66)), // Orange
      _ChartData('Taxes', 6,const  Color(0xFF99CC33)), // Light Green
      _ChartData('Insurance', 18,const Color(0xFFE499FF)), // Light Pink
    ];

    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Chi phí'),
        ),
        body: SfCircularChart(
            tooltipBehavior: _tooltip,
            series: <CircularSeries<_ChartData, String>>[
              DoughnutSeries<_ChartData, String>(
                  dataSource: data,
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (_ChartData data, _) => data.y,
                  pointColorMapper: (_ChartData data, _) => data.color,
                  innerRadius: '50%',
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    labelPosition: ChartDataLabelPosition.outside,
                  ),
                  name: 'Project Cost'),
            ],
            legend: const Legend(
                isVisible: true,
                overflowMode: LegendItemOverflowMode.wrap,
                position: LegendPosition.right)
        )
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
