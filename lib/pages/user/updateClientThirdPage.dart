import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:st_credit/pages/analyst/AnalysisDone.dart';
import 'package:flutter/material.dart';

import '../../firebase/firebase_auth.dart';
import '../../firebase/firebase_service.dart';
import 'updateClientOnePage.dart';

class UpdateClientThirdPage extends StatefulWidget {
  final Client client;

  UpdateClientThirdPage({required this.client});

  @override
  _UpdateClientThirdPageState createState() => _UpdateClientThirdPageState();
}

class _UpdateClientThirdPageState extends State<UpdateClientThirdPage> {
  final FirebaseService firebaseService = FirebaseService();
  FirebaseFirestore db = FirebaseFirestore.instance;

  String emailClient = '';
  final TextEditingController _temEmpregoController = TextEditingController();
  final TextEditingController _temOcupacaoController = TextEditingController();
  final TextEditingController _rendimentoAnualController =
      TextEditingController();

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
          _temEmpregoController.text = client['tem_emprego'];
          _temOcupacaoController.text = client['ocupacao'];
          _rendimentoAnualController.text = client['rendimento_anual'];
          emailClient = email;
        });
      } else {
        print('Usuário não encontrado.');
      }
    } catch (e) {
      print('Erro ao obter usuário: $e');
    }
  }

  Widget _buildJobStatus() {
    List<String> jobStatusOptions = ['Tem emprego?', 'Sim', 'Não'];

    return Container(
      width: double.infinity,
      child: DropdownButton<String>(
        value: dropdownValue1,
        items: jobStatusOptions.map<DropdownMenuItem<String>>((String value) {
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

  Widget _buildJob() {
    List<String> jobOptions = [
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
    ];

    return Container(
      width: double.infinity,
      child: DropdownButton<String>(
        value: dropdownValue2,
        items: jobOptions.map<DropdownMenuItem<String>>((String value) {
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

  Widget _buildAnnualIncome() {
    return TextFormField(
      controller: _rendimentoAnualController,
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
      'ocupacao': ocupacao,
      'rendimento_anual': rendimentoAnual,
      'status': 'em analise',
      'email': email
    };

    await firebaseService.updateClientByEmail(email, userData);
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
                      'Atualize seus dados financeiros.',
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
                                      dropdownValue1,
                                      dropdownValue2,
                                      _rendimentoAnualController.text.trim(),
                                      myClient.email);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AnalysisDone(
                                                email: myClient.email,
                                                nome: myClient.nome,
                                              )));
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
