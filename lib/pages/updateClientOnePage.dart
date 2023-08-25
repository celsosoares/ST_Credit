import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:st_credit/pages/updateClientSecondPage.dart';
import '../firebase/firebase_auth.dart';
import '../firebase/firebase_service.dart';

class Client {
  final String nome;
  final String sobrenome;
  final String idade;
  final String escolaridade;
  final String estadoCivil;
  final String filhos;
  final String temCarro;
  final String temPropriedade;
  final String tipoDeMoradia;
  final String temEmprego;
  final String ocupacao;
  final String redimentoAnual;
  final String status;
  final String email;

  Client({
    required this.nome,
    required this.sobrenome,
    required this.idade,
    required this.escolaridade,
    required this.estadoCivil,
    required this.filhos,
    required this.temCarro,
    required this.temPropriedade,
    required this.tipoDeMoradia,
    required this.temEmprego,
    required this.ocupacao,
    required this.redimentoAnual,
    required this.status,
    required this.email,
  });
}

class UpdateClientOnePage extends StatefulWidget {
  final String email;
  UpdateClientOnePage({required this.email});

  @override
  _UpdateClientOnePageState createState() => _UpdateClientOnePageState();
}

class _UpdateClientOnePageState extends State<UpdateClientOnePage> {
  String emailClient = '';
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _sobrenomeController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  TextEditingController _escolaridadeController = TextEditingController();
  TextEditingController _estadoCivilController = TextEditingController();
  TextEditingController _filhosController = TextEditingController();

  AuthService authService = AuthService();

  final FirebaseService firebaseService = FirebaseService();

  @override
  void initState() {
    super.initState();
    _performRequests(widget.email);
  }

  Future<void> _performRequests(email) async {
    try {
      String email = widget.email;

      Map<String, dynamic>? client =
          await firebaseService.getClientByEmail(email);

      if (client != null) {
        setState(() {
          _nomeController.text = client['nome'];
          _sobrenomeController.text = client['sobrenome'];
          _idadeController.text = client['idade'];
          _estadoCivilController.text = client['estado_civil'];
          _filhosController.text = client['filhos'];
          _escolaridadeController.text = client['escolaridade'];
          emailClient = email;
        });
      } else {
        print('Usuário não encontrado.');
      }
    } catch (e) {
      print('Erro ao obter usuário: $e');
    }
  }

  Widget _buildTextName() {
    return TextFormField(
      controller: _nomeController,
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
      controller: _sobrenomeController,
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
      controller: _idadeController,
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
    List<String> escolaridadeOptions = [
      "Escolaridade",
      "Ensino Superior",
      "Ensino Médio / Ensino Médio Técnico",
      "Ensino Superior Incompleto",
      "Ensino Fundamental",
      "Pós graduação/Mestrado/Doutorado"
    ];

    return Container(
      width: double.infinity,
      child: DropdownButton<String>(
        value: dropdownValue3,
        items:
            escolaridadeOptions.map<DropdownMenuItem<String>>((String value) {
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

  Widget _buildMaritalStatus() {
    List<String> maritalStatusOptions = [
      "Estado Civil",
      'União estável',
      'Casado(a)',
      'Solteiro(a) / Não casado(a)',
      'Separado(a)',
      'Viúvo(a)'
    ];

    return Container(
      width: double.infinity,
      child: DropdownButton<String>(
        value: dropdownValue1,
        items:
            maritalStatusOptions.map<DropdownMenuItem<String>>((String value) {
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

  Widget _buildChildren() {
    List<String> childrenOptions = [
      "Filhos",
      '0',
      '1',
      '2',
      '3 ou mais'
    ];

    return Container(
      width: double.infinity,
      child: DropdownButton<String>(
        value: dropdownValue2,
        items: childrenOptions.map<DropdownMenuItem<String>>((String value) {
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
                      'Atualize seus dados pessoais.',
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
                                      backgroundColor: const Color.fromARGB(
                                          255, 57, 115, 240),
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UpdateClientSecondPage(
                                                  client: Client(
                                                      nome: _nomeController.text
                                                          .trim(),
                                                      sobrenome:
                                                          _sobrenomeController
                                                              .text
                                                              .trim(),
                                                      idade: _idadeController
                                                          .text
                                                          .trim(),
                                                      escolaridade:
                                                          dropdownValue3,
                                                      estadoCivil:
                                                          dropdownValue1,
                                                      filhos: dropdownValue2,
                                                      temCarro: "",
                                                      temPropriedade: "",
                                                      tipoDeMoradia: "",
                                                      temEmprego: "",
                                                      ocupacao: "",
                                                      redimentoAnual: "",
                                                      status: "",
                                                      email: widget.email),
                                                )));
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
