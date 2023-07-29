import 'package:google_fonts/google_fonts.dart';
import 'package:st_credit/pages/TerceiroPasso.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class ClientAnalysisSecondPage extends StatefulWidget {
  @override
  _ClientAnalysisSecondPageState createState() => _ClientAnalysisSecondPageState();
}

class _ClientAnalysisSecondPageState extends State<ClientAnalysisSecondPage> {

  Widget _buildCarStatus() {
    return Container(
      width: double.infinity,
      child: DropdownButton<String>(
        autofocus: true,
        value: dropdownValue1,
        items: <String>[
          'Tem carro?',
          'Sim',
          'Não'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(
                  color: Color.fromRGBO(30, 30, 30, 100), fontSize: 15),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue1 = newValue!;
          });
        },
      ),
    );
  }

  Widget _buildPropertyStatus() {
    return Container(
      width: double.infinity,
      child: DropdownButton<String>(
        autofocus: true,
        value: dropdownValue2,
        items: <String>[
          'Tem propriedades?',
          'Sim',
          'Não'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(
                  color: Color.fromRGBO(30, 30, 30, 100), fontSize: 15),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue2 = newValue!;
          });
        },
      ),
    );
  }

  Widget _buildTypeHousing() {
    return Container(
      width: double.infinity,
      child: DropdownButton<String>(
        autofocus: true,
        value: dropdownValue3,
        items: <String>[
          'Tipo de moradia',
          "Apartamento Alugado",
          "Casa / Apartamento Próprio",
          "Apartamento Municipal",
          "Com os Pais",
          "Apartamento em Cooperativa",
          "Apartamento no Escritório"
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(
                  color: Color.fromRGBO(30, 30, 30, 100), fontSize: 15),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue3 = newValue!;
          });
        },
      ),
    );
  }

  String dropdownValue1 = 'Tem carro?';
  String dropdownValue2 = 'Tem propriedades?';
  String dropdownValue3 = 'Tipo de moradia';


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: Text(
            "Análise",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
            padding: EdgeInsets.all(35),
            child: Center(
              child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Informe seus dados posses.',
                      style: GoogleFonts.dmSans(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: Form(
                      key: _formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Divider(),
                            _buildCarStatus(),
                            SizedBox(
                              height: 10,
                            ),
                            _buildPropertyStatus(),
                            SizedBox(
                              height: 10,
                            ),
                            _buildTypeHousing(),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50.0,
                              width: 430.0,
                              child: ElevatedButton(
                                child: Text('Continuar'),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                    Color.fromARGB(255, 57, 115, 240),
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ClientAnalysisThirdPage()));
                                },
                              ),
                            ),
                            SizedBox(height: 50),
                          ]),
                    ),
                  )
                ]),
              ),
            )));
  }
}
