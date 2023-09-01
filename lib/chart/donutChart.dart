import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../firebase/firebase_service.dart';

class DonutChart extends StatefulWidget {
  const DonutChart({Key? key}) : super(key: key);
  @override
  State<DonutChart> createState() => _DonutChartState();
}

class _DonutChartState extends State<DonutChart> {

  int qtdClientsApproved = 0;
  int qtdClientsDenied =0;
  final FirebaseService firebaseService = FirebaseService();

  Future<void> qtdAnalysisApproved() async {
    List<Map<String, dynamic>> qtdAprovved = await firebaseService.getClientsApproved();
    setState(() {
      qtdClientsApproved = qtdAprovved.length;
    });
  }

  Future<void> qtdAnalysisDenied() async {
    List<Map<String, dynamic>> qtdDenied = await firebaseService.getClientsDenied();
    setState(() {
      qtdClientsDenied = qtdDenied.length;
    });
  }

  @override
  void initState() {
    super.initState();
    qtdAnalysisApproved();
    qtdAnalysisDenied();
  }

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
                    value: qtdClientsApproved.toDouble(),
                    radius: 30,
                    showTitle: false,
                    color: Colors.blue,
                    title: 'Aprovados'
                ),
                PieChartSectionData(
                    value: qtdClientsDenied.toDouble(),
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
            _buildLegend(color: Colors.blue, label: 'Aprovados', value: qtdClientsApproved),
            _buildLegend(color: Colors.red, label: 'Negados', value: qtdClientsDenied)
          ],
        )
      ],
    );
  }
}

Widget _buildLegend({required Color color, required String label, required int value}) {
  print(value);
  return Row(
    children: [
      Container(
        width: 10,
        height: 10,
        color: color,
      ),
      SizedBox(width: 5),
      Text(label),
      Text(": "),
      Text(value.toString())
    ],
  );
}
