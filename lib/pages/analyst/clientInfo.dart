import 'package:flutter/material.dart';
import 'package:st_credit/firebase/firebase_auth.dart';
import 'package:st_credit/firebase/firebase_service.dart';
import 'package:st_credit/pages/analyst/analysisDoneAnalist.dart';

class ClientInfo extends StatefulWidget {
  final String email;

  ClientInfo({required this.email});
  @override
  _ClientInfoState createState() => _ClientInfoState();
}

class _ClientInfoState extends State<ClientInfo> {
  String nomeClient = '';
  String sobrenomeClient = '';
  String idadeClient = '';
  String estadoCivilClient = '';
  String escolaridadeClient = '';
  String filhosClient = '';
  String temCarroClient = '';
  String temPropriedadeClient = '';
  String tipoMoradiaClient = '';
  String rendimentoAnualClient = '';
  String emailClient = '';
  String statusClient = '';
  AuthService authService = AuthService();

  final FirebaseService firebaseService = FirebaseService();

  @override
  void initState() {
    super.initState();
    _performRequestsClient();
  }

  Future<void> _performRequestsClient() async {
    try {
      String email = widget.email;

      Map<String, dynamic>? client =
          await firebaseService.getClientByEmail(email);

      if (client != null) {
        setState(() {
          nomeClient = client['nome'] != null ? client['nome'] : "";
          sobrenomeClient =
              client['sobrenome'] != null ? client['sobrenome'] : "";
          idadeClient = client['idade'] != null ? client['idade'] : "";
          estadoCivilClient =
              client['estado_civil'] != null ? client['estado_civil'] : "";
          escolaridadeClient =
              client['escolaridade'] != null ? client['escolaridade'] : "";
          filhosClient = client['filhos'] != null ? client['filhos'] : "";
          temCarroClient =
              client['tem_carro'] != null ? client['tem_carro'] : "";
          temPropriedadeClient = client['tem_propriedade'] != null
              ? client['tem_propriedade']
              : "";
          tipoMoradiaClient =
              client['tipo_moradia'] != null ? client['tipo_moradia'] : "";
          rendimentoAnualClient = client['rendimento_anual'] != null
              ? client['rendimento_anual']
              : "";
          statusClient = client['status'] != null ? client['status'] : "";
          emailClient = client['email'];
        });
      } else {
        print('Cliente não encontrado.');
      }
    } catch (e) {
      print('Erro ao obter cliente: $e');
    }
  }

  void sendStatus(status, email) async {
    Map<String, dynamic> userData = {'status': status, 'email': email};

    await firebaseService.updateClientByEmail(email, userData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text("Análise", style: TextStyle(color: Colors.black))),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("SOLICITANTE",
                      style: TextStyle(color: Color(0xff0E2F71))),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nome",
                        style: TextStyle(color: Color(0xff979797)),
                      ),
                      Text(
                        nomeClient,
                        style: TextStyle(color: Color(0xff414141)),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sobrenome",
                        style: TextStyle(color: Color(0xff979797)),
                      ),
                      Text(
                        sobrenomeClient,
                        style: TextStyle(color: Color(0xff414141)),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("INFORMAÇÕES PESSOAIS",
                      style: TextStyle(color: Color(0xff0E2F71))),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Idade",
                        style: TextStyle(color: Color(0xff979797)),
                      ),
                      Text(
                        idadeClient,
                        style: TextStyle(color: Color(0xff414141)),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Estado Civil",
                        style: TextStyle(color: Color(0xff979797)),
                      ),
                      Text(
                        estadoCivilClient,
                        style: TextStyle(color: Color(0xff414141)),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nível de educação",
                        style: TextStyle(color: Color(0xff979797)),
                      ),
                      Text(
                        escolaridadeClient,
                        style: TextStyle(color: Color(0xff414141)),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Filhos",
                        style: TextStyle(color: Color(0xff979797)),
                      ),
                      Text(
                        filhosClient,
                        style: TextStyle(color: Color(0xff414141)),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("INFORMAÇÕES DE POSSES",
                      style: TextStyle(color: Color(0xff0E2F71))),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Possui carro?",
                        style: TextStyle(color: Color(0xff979797)),
                      ),
                      Text(
                        temCarroClient,
                        style: TextStyle(color: Color(0xff414141)),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Possui propriedades?",
                        style: TextStyle(color: Color(0xff979797)),
                      ),
                      Text(
                        temPropriedadeClient,
                        style: TextStyle(color: Color(0xff414141)),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Modo de viver",
                        style: TextStyle(color: Color(0xff979797)),
                      ),
                      Text(
                        tipoMoradiaClient,
                        style: TextStyle(color: Color(0xff414141)),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("INFORMAÇÕES FINANCEIRAS",
                      style: TextStyle(color: Color(0xff0E2F71))),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categoria de renda",
                        style: TextStyle(color: Color(0xff979797)),
                      ),
                      Text(
                        "-",
                        style: TextStyle(color: Color(0xff414141)),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rendimento anual",
                        style: TextStyle(color: Color(0xff979797)),
                      ),
                      Text(
                        rendimentoAnualClient,
                        style: TextStyle(color: Color(0xff414141)),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Empréstimo",
                        style: TextStyle(color: Color(0xff979797)),
                      ),
                      Text(
                        "-",
                        style: TextStyle(color: Color(0xff414141)),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Status",
                        style: TextStyle(color: Color(0xff979797)),
                      ),
                      Text(
                        statusClient,
                        style: TextStyle(color: Color(0xff414141)),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 50),
              Column(
                children: [
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 45.0,
                        width: 200.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 57, 115, 240),
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0,
                            ),
                          ),
                          onPressed: () {
                            sendStatus("aprovado", emailClient);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AnalysisDoneAnalist()));
                          },
                          child: const Text('Aprovar'),
                        ),
                      ),
                      Container(
                        height: 45.0,
                        width: 200.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.red, // Cor para o botão de "Negar"
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0,
                            ),
                          ),
                          onPressed: () {
                            sendStatus("negado", emailClient);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AnalysisDoneAnalist()));
                          },
                          child: const Text('Negar'),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
