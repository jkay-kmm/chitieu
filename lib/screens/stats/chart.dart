import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyChart extends StatefulWidget {
  const MyChart({super.key});


  @override
  State<MyChart> createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Flutter Pie Chart Example',),
      ),
      body: Center(
        child: PieChart(
          PieChartData(
            sections: showingSections(),
            sectionsSpace: 2,
            centerSpaceRadius: 40,
            pieTouchData: PieTouchData(
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                if (!event.isInterestedForInteractions ||
                    pieTouchResponse == null ||
                    pieTouchResponse.touchedSection == null) {
                  setState(() {});
                  return;
                }
                final touchedIndex =
                    pieTouchResponse.touchedSection!.touchedSectionIndex;

                setState(() {
                  // Here you can change the state to highlight the touched section
                });
              },
            ),
            borderData: FlBorderData(
              show: false,
            ),
            startDegreeOffset: 0,
          ),
        ),

      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(8, (i) {
      switch (i) {
        case 0:
          return makePieSectionData(0, 20, '01', Colors.blueGrey);
        case 1:
          return makePieSectionData(1, 30, '02', Colors.redAccent);
        case 2:
          return makePieSectionData(2, 20, '03', Colors.lightGreen);
        case 3:
          return makePieSectionData(3, 100, '04', Colors.yellow);
        case 4:
          return makePieSectionData(4, 38, '05', Colors.orange);
        case 5:
          return makePieSectionData(5, 15, '06', Colors.purple);
        case 6:
          return makePieSectionData(6, 40, '07', Colors.pink);
        case 7:
          return makePieSectionData(7, 38, '08', Colors.teal);
        default:
          return throw Error();
      }
    });
  }

  PieChartSectionData makePieSectionData(
      int index, double value, String title, Color color) {
    const isTouched = false;
    const double fontSize = isTouched ? 25 : 16;
    const double radius = isTouched ? 60 : 50;

    return PieChartSectionData(
      color: color,
      value: value,
      title: '$title%',
      radius: radius,
      titleStyle:const  TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
