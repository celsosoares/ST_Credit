import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:st_credit/pages/updateClientOnePage.dart';
import 'package:st_credit/pages/updateClientThirdPage.dart';

import '../firebase/firebase_auth.dart';
import '../firebase/firebase_service.dart';

class UpdateClientSecondPage extends StatefulWidget {
  final Client client;

  UpdateClientSecondPage({required this.client});

  @override
  _UpdateClientSecondPageState createState() => _UpdateClientSecondPageState();
}

class _UpdateClientSecondPageState extends State<UpdateClientSecondPage> {
  final FirebaseService firebaseService = FirebaseService();
  FirebaseFirestore db = FirebaseFirestore.instance;

  String emailClient = '';
  TextEditingController _temCarroController = TextEditingController();
  TextEditingController _temPropriedadeController = TextEditingController();
  TextEditingController _tipoMoradiaController = TextEditingController();

  AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    _performRequests(widget.client.email);
  }

  Future<void> _performRequests(email) async {
    try {
      String email = widget.client.email;

      Map<String, dynamic>? client =
          await firebaseService.getClientByEmail(email);

      if (client != null) {
        setState(() {
          _temCarroController.text = client['tem_carro'];
          _temPropriedadeController.text = client['tem_propriedade'];
          _tipoMoradiaController.text = client['tipo_moradia'];
          emailClient = email;
        });
      } else {
        print('Usuário não encontrado.');
      }
    } catch (e) {
      print('Erro ao obter usuário: $e');
    }
  }

  Widget _buildCarStatus() {
    List<String> carStatusOptions = ['Sim', 'Não'];

    return Container(
      width: double.infinity,
      child: DropdownButton<String>(
        value: dropdownValue1.isEmpty ? "Tem carro?" : dropdownValue1,
        items: ["Tem carro?", ...carStatusOptions]
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(
                color: Color.fromRGBO(30, 30, 30, 100),
                fontSize: 15,
              ),
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
    List<String> propertyStatusOptions = ['Sim', 'Não'];
    String defaultValue = "Tem propriedades?";

    return Container(
      width: double.infinity,
      child: DropdownButton<String>(
        value: dropdownValue2.isEmpty ? defaultValue : dropdownValue2,
        items: [defaultValue, ...propertyStatusOptions]
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(
                color: Color.fromRGBO(30, 30, 30, 100),
                fontSize: 15,
              ),
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
    List<String> typeHousingOptions = [
      "Apartamento Alugado",
      "Casa / Apartamento Próprio",
      "Apartamento Municipal",
      "Com os Pais",
      "Apartamento em Cooperativa",
      "Apartamento no Escritório"
    ];
    String defaultValue = "Tipo de moradia";

    return Container(
      width: double.infinity,
      child: DropdownButton<String>(
        value: dropdownValue3.isEmpty ? defaultValue : dropdownValue3,
        items: [defaultValue, ...typeHousingOptions]
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(
                color: Color.fromRGBO(30, 30, 30, 100),
                fontSize: 15,
              ),
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
            icon: const Icon(Icons.arrow_back),
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
                      'Atualize seus dados posses.',
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
                            _buildCarStatus(),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildPropertyStatus(),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildTypeHousing(),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50.0,
                              width: 430.0,
                              child: ElevatedButton(
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
                                          builder: (context) =>
                                              UpdateClientThirdPage(
                                                  client: Client(
                                                      nome: myClient.nome,
                                                      sobrenome:
                                                          myClient.sobrenome,
                                                      idade: myClient.idade,
                                                      escolaridade:
                                                          myClient.escolaridade,
                                                      estadoCivil:
                                                          myClient.estadoCivil,
                                                      filhos: myClient.filhos,
                                                      temCarro: dropdownValue1,
                                                      temPropriedade:
                                                          dropdownValue2,
                                                      tipoDeMoradia:
                                                          dropdownValue3,
                                                      temEmprego: "",
                                                      ocupacao: "",
                                                      redimentoAnual: "",
                                                      status: "",
                                                      email: myClient.email)),
                                        ));
                                  },
                                  child: const Text('Continuar')),
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
