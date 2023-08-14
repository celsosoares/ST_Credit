import 'package:flutter/material.dart';
import 'package:st_credit/pages/initialPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ST Credit",
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 11, 43, 185),
      ),
      home: InitialPage(),
    );
  }
}
