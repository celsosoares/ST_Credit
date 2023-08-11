import 'package:google_fonts/google_fonts.dart';
import 'package:st_credit/pages/clientAnalysisSecondPage.dart';
import 'package:flutter/material.dart';


class ClientAnalysisOnePage extends StatefulWidget {
  @override
  _ClientAnalysisOnePageState createState() => _ClientAnalysisOnePageState();
}

class _ClientAnalysisOnePageState extends State<ClientAnalysisOnePage> {

  Widget _buildTextName() {
    return TextFormField(
      autofocus: true,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          labelText: "Nome",
          labelStyle:
          TextStyle(color: Color.fromRGBO(30, 30, 30, 100), fontSize: 15)),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "O nome é obrigatório";
        } else if (value != null && value.length > 18) {
          return "O nome pode ter no máximo 18 caracteres";
        }
        return null;
      },
    );
  }

  Widget _buildTextLastName() {
    return TextFormField(
      autofocus: true,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          labelText: "Sobrenome",
          labelStyle:
          TextStyle(color: Color.fromRGBO(30, 30, 30, 100), fontSize: 15)),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "O sobrenome é obrigatório";
        } else if (value != null && value.length > 18) {
          return "O sobrenome pode ter no máximo 18 caracteres";
        }
        return null;
      },
    );
  }

  Widget _buildTextAge() {
    return TextFormField(
      autofocus: true,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          labelText: "Idade",
          labelStyle:
          TextStyle(color: Color.fromRGBO(30, 30, 30, 100), fontSize: 15)),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "A idade é obrigatório";
        } else if (value != null && value.length > 100) {
          return "Idade invalida";
        }
        return null;
      },
    );
  }

  Widget _buildSchooling() {
    return Container(
      width: double.infinity,
      child: DropdownButton<String>(
        autofocus: true,
        value: dropdownValue3,
        items: <String>[
          "Escolaridade",
          "Ensino Superior",
          "Ensino Médio / Ensino Médio Técnico",
          "Ensino Superior Incompleto",
          "Ensino Fundamental",
          "Pós graduação/Mestrado/Doutorado"
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(
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


  Widget _buildMaritalStatus() {
    return Container(
      width: double.infinity,
      child: DropdownButton<String>(
        autofocus: true,
        value: dropdownValue1,
        items: <String>[
          'Estado Civil',
          'União estável',
          'Casado(a)',
          'Solteiro(a) / Não casado(a)',
          'Separado(a)',
          'Viúvo(a)'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(
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

  Widget _buildChildren() {
    return Container(
      width: double.infinity,
      child: DropdownButton<String>(
        autofocus: true,
        value: dropdownValue2,
        items: <String>['Filhos', '0', '1', '2', '3 ou mais']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(
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

  String dropdownValue1 = 'Estado Civil';
  String dropdownValue2 = 'Filhos';
  String dropdownValue3 = 'Escolaridade';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: const Text(
            "Análise",
            style:  TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon:  Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
            padding: const EdgeInsets.all(35),
            child: Center(
              child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Informe seus dados pessoais.',
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
                            const Divider(),
                            _buildTextName(),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildTextLastName(),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildTextAge(),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildSchooling(),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildMaritalStatus(),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildChildren(),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50.0,
                              width: 430.0,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(255, 57, 115, 240),
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ClientAnalysisSecondPage()));
                                },
                                  child: const Text('Continuar')
                              ),
                            ),
                            const SizedBox(height: 50),
                          ]),
                    ),
                  )
                ]),
              ),
            )));
  }
}
