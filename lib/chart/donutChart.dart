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
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [ Container(
      height: 120,
      width: 120,
      child: PieChart(
          PieChartData(
              startDegreeOffset: -90,
              sections:[
                PieChartSectionData(
                    value: 75,
                    radius: 30,
                    showTitle: false,
                    color: Colors.blue,
                    title: 'Aprovados'
                ),
                PieChartSectionData(
                    value: 25,
                    radius: 30,
                    showTitle: false,
                    color: Colors.red,
                    title: 'Negados'
                )
              ],
              borderData: FlBorderData(show: false),
              sectionsSpace: 0
          )
      ),
    ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLegend(color: Colors.blue, label: 'Aprovados'),
            _buildLegend(color: Colors.red, label: 'Negados')
          ],
        )
      ],
    );
  }
}

Widget _buildLegend({required Color color, required String label}) {
  return Row(
    children: [
      Container(
        width: 10,
        height: 10,
        color: color,
      ),
      SizedBox(width: 5),
      Text(label),
    ],
  );
}
