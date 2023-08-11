import 'package:st_credit/pages/signinPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(35),
            child: Center(
              child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/logotipo.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 180),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Bem vindo ao ST Credit!',
                    style: GoogleFonts.dmSans(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'O seu aplicativo para solicitação e análise de cartões de crédito.',
                    style: GoogleFonts.dmSans(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 12.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 45.0,
                  width: 430.0,
                  child: ElevatedButton(
                    child: Text('Sou um Analista Financeiro'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 57, 115, 240),
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.0,
                        )),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInPage()));
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 45.0,
                  width: 430.0,
                  child: ElevatedButton(
                    child: Text('Sou um Cliente'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 0, 0, 0),
                        side: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                            width: 1.0),
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.0,
                        )),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInPage()));
                    },
                  ),
                ),
              ])),
            ),
          ),
        ));
  }
}
