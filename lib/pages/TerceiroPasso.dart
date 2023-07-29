import 'package:google_fonts/google_fonts.dart';
import 'package:st_credit/pages/AnalysisDone.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class ClientAnalysisThirdPage extends StatefulWidget {
  @override
  _ClientAnalysisThirdPageState createState() => _ClientAnalysisThirdPageState();
}

class _ClientAnalysisThirdPageState extends State<ClientAnalysisThirdPage> {

  Widget _buildJobStatus() {
    return Container(
      width: double.infinity,
      child: DropdownButton<String>(
        autofocus: true,
        value: dropdownValue1,
        items: <String>[
          'Tem emprego?',
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

  Widget _buildJob() {
    return Container(
      width: double.infinity,
      child: DropdownButton<String>(
        autofocus: true,
        value: dropdownValue2,
        items: <String>[
          'Ocupação',
          'Segurança',
          'Equipe de Vendas',
          'Contadores',
          'Trabalhadores',
          'Gerentes',
          'Motoristas',
          'Equipe Principal',
          'Equipe Técnica de Alta Qualificação',
          'Equipe de Limpeza',
          'Equipe de Serviço Privado',
          'Equipe de Cozinha',
          'Trabalhadores de Baixa Qualificação',
          'Equipe de Medicina',
          'Secretárias',
          'Equipe de Garçons/Barmen',
          'Equipe de Recursos Humanos',
          'Agentes Imobiliários',
          'Equipe de TI'
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

  Widget _buildAnnualIncome() {
    return TextFormField(
      autofocus: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          labelText: "Rendimento anual",
          labelStyle:
          TextStyle(color: Color.fromRGBO(30, 30, 30, 100), fontSize: 15)),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "O rendimento anual é obrigatório";
        } else if (value != null && value.length > 30) {
          return "Rendimento anual invalido";
        }
        return null;
      },
    );
  }

  String dropdownValue1 = 'Tem emprego?';
  String dropdownValue2 = 'Ocupação';


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
                      'Informe seus dados financeiros.',
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
                            _buildJobStatus(),
                            SizedBox(
                              height: 10,
                            ),
                            _buildJob(),
                            SizedBox(
                              height: 10,
                            ),
                            _buildAnnualIncome(),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50.0,
                              width: 430.0,
                              child: ElevatedButton(
                                child: Text('Concluir'),
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
                                          builder: (context) => AnalysisDone()));
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
