import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:st_credit/pages/AnalysisDone.dart';
import 'package:flutter/material.dart';

import '../firebase/firebase_auth.dart';
import '../firebase/firebase_service.dart';
import 'clientAnalysisOnePage.dart';

class ClientAnalysisThirdPage extends StatefulWidget {
  final Client client;

  ClientAnalysisThirdPage({required this.client});

  @override
  _ClientAnalysisThirdPageState createState() =>
      _ClientAnalysisThirdPageState();
}

class _ClientAnalysisThirdPageState extends State<ClientAnalysisThirdPage> {
  final FirebaseService firebaseService = FirebaseService();
  FirebaseFirestore db = FirebaseFirestore.instance;

  final TextEditingController _temEmpregoController = TextEditingController();
  final TextEditingController _temOcupacaoController = TextEditingController();
  final TextEditingController _rendimentoAnualController =
      TextEditingController();

  AuthService authService = AuthService();

  Widget _buildJobStatus() {
    return Container(
      width: double.infinity,
      child: DropdownButton<String>(
        autofocus: true,
        value: dropdownValue1,
        items: <String>['Tem emprego?', 'Sim', 'Não']
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

  Widget _buildAnnualIncome() {
    return TextFormField(
      autofocus: true,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
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

  void sendData(
      nome,
      sobrenome,
      idade,
      escolaridade,
      estadoCivil,
      filhos,
      temCarro,
      temPropriedade,
      tipoMoradia,
      temEmprego,
      ocupacao,
      rendimentoAnual,
      email) async {
    Map<String, dynamic> userData = {
      'nome': nome,
      'sobrenome': sobrenome,
      'idade': idade,
      'escolaridade': escolaridade,
      'estado_civil': estadoCivil,
      'filhos': filhos,
      'tem_carro': temCarro,
      'tem_propriedade': temPropriedade,
      'tipo_moradia': tipoMoradia,
      'tem_emprego': temEmprego,
      'ocupacao': rendimentoAnual,
      'status': 'em analise',
      'email': email
    };

    await firebaseService.addClient(userData);
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Client myClient = widget.client;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: const Text(
            "Análise",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
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
                            const Divider(),
                            _buildJobStatus(),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildJob(),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildAnnualIncome(),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50.0,
                              width: 430.0,
                              child: ElevatedButton(
                                child: const Text('Concluir'),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 57, 115, 240),
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {
                                  sendData(
                                      myClient.nome,
                                      myClient.sobrenome,
                                      myClient.idade,
                                      myClient.escolaridade,
                                      myClient.estadoCivil,
                                      myClient.filhos,
                                      myClient.temCarro,
                                      myClient.temPropriedade,
                                      myClient.tipoDeMoradia,
                                      myClient.temEmprego,
                                      myClient.ocupacao,
                                      myClient.redimentoAnual,
                                      myClient.email);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AnalysisDone()));
                                },
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
