import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DonutChart extends StatefulWidget {
  const DonutChart({Key? key}) : super(key: key);

  @override
  State<DonutChart> createState() => _DonutChartState();
}

class _DonutChartState extends State<DonutChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child: PieChart(
        PieChartData(
            startDegreeOffset: -90,
            sections:[
          PieChartSectionData(
            value: 30,
            radius: 30,
            showTitle: false,
            color: Colors.blue
          ),
          PieChartSectionData(
              value: 30,
              radius: 30,
              showTitle: false,
              color: Colors.green
          )
        ]
        )
      ),
    );
  }
}
