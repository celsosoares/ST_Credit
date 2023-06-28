import 'package:flutter/material.dart';
import 'package:st_credit/pages/signinPage.dart';

void main()
{
  runApp(MainApp());
}

class MainApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ST Credit",
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 11, 43, 185),
      ),
      // TODO
      // home: PreviewPage(),
      home: SignInPage(),
    );
  }
  
}