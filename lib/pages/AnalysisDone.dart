import 'package:st_credit/pages/homeUser.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnalysisDone extends StatefulWidget {
  @override
  _AnalysisDone createState() => _AnalysisDone();
}

class _AnalysisDone extends State<AnalysisDone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(35),
            child: Center(
              child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/seila.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Análise de crédito solicitada!',
                    style: GoogleFonts.dmSans(
                      color: Color.fromARGB(255, 0, 0, 0),
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
                    'Verifique se foi aprovado a solicitação em Histórico de Análise.',
                    style: GoogleFonts.dmSans(
                      color: Color.fromARGB(255, 0, 0, 0),
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
                    child: Text('Voltar para tela Home'),
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
                              builder: (context) => HomeUser(
                                  email: "email", nome: "Nome do Usuário")));
                    },
                  ),
                ),
                SizedBox(height: 20),
              ])),
            ),
          ),
        ));
  }
}
