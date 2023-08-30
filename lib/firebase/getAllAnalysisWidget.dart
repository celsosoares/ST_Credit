import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/homeAnalyst.dart';
import 'firebase_service.dart';

class GetAllAnalysisWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: FirebaseService().getAllAnalysis(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.hasData) {
          List<Map<String, dynamic>> documents = snapshot.data!;
          return HomeAnalyst(data: documents);
        }

        return Text('No data available');
      },
    );
  }
}