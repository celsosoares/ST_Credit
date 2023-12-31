import 'package:st_credit/pages/user/faqPage.dart';
import 'package:st_credit/pages/user/statusPage.dart';
import 'package:st_credit/pages/user/updateClientOnePage.dart';
import 'package:st_credit/pages/user/userHistory.dart';
import 'package:flutter/material.dart';
import 'package:st_credit/pages/user/clientAnalysisOnePage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:st_credit/utils/utils.dart';

import '../../firebase/firebase_service.dart';
import '../../firebase/firebase_auth.dart';

class HomeUser extends StatefulWidget {
  final String email;
  final String nome;

  HomeUser({required this.email, required this.nome});

  @override
  _HomeUserState createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  String nomeUsuario = '';
  String emailUsuario = '';
  String perfilUsuario = '';
  String idUsuario = '';
  String emailClient = '';
  int _currentIndex = 0;
  AuthService authService = AuthService();

  final FirebaseService firebaseService = FirebaseService();

  @override
  void initState() {
    super.initState();
    _performRequestsUser();
    _performRequestsClient();
  }

  Future<void> _performRequestsUser() async {
    try {
      String email = widget.email;

      Map<String, dynamic>? user = await firebaseService.getUserByEmail(email);

      if (user != null) {
        setState(() {
          nomeUsuario = user['nome'];
          emailUsuario = user['email'];
          perfilUsuario = user['perfil'];
          idUsuario = user['id'];
        });
      } else {
        print('Usuário não encontrado.');
      }
    } catch (e) {
      print('Erro ao obter usuário: $e');
    }
  }

  Future<void> _performRequestsClient() async {
    try {
      String email = widget.email;

      Map<String, dynamic>? client =
          await firebaseService.getClientByEmail(email);

      if (client != null) {
        setState(() {
          emailClient = client['email'];
        });
      } else {
        print('Cliente não encontrado.');
      }
    } catch (e) {
      print('Erro ao obter cliente: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF2A64D9),
        child: Column(
          children: [
            Container(
              height: 240,
              color: const Color(0xFF2A64D9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Bem vindo,',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          Utils().getName(nomeUsuario),
                          style: const TextStyle(
                              fontSize: 34,
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        Utils().getNameInitials(nomeUsuario),
                        style: const TextStyle(
                            color: Color(0xFF2A64D9),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    )),
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Serviços",
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                    Container(
                        height: 80,
                        width: 350,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey, width: 0.10)),
                        child: ElevatedButton(
                          onPressed: () {
                            if (emailClient != "") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UpdateClientOnePage(
                                          email: emailClient)));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ClientAnalysisOnePage(
                                              email: emailUsuario)));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF7F8F9)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/add.png"))),
                              ),
                              const Text(
                                "Solicitar análise de crédito",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        )),
                    Container(
                        height: 80,
                        width: 350,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey, width: 0.10)),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StatusPage(
                                      email: emailUsuario, nome: nomeUsuario)),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF7F8F9)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/status.png"))),
                              ),
                              const Text(
                                "Status da sua análise",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        )),
                    Container(
                        height: 80,
                        width: 350,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey, width: 0.10)),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserHistory(
                                        email: emailUsuario,
                                        nome: nomeUsuario,
                                      )),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF7F8F9)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/history.png"))),
                              ),
                              const Text(
                                "Histórico de análises",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        )),
                    Container(
                        height: 80,
                        width: 350,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey, width: 0.10)),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FAQPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF7F8F9)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/ask.png"))),
                              ),
                              const Text(
                                "Perguntas frequentes",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (_currentIndex == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      HomeUser(email: emailUsuario, nome: nomeUsuario)),
            );
          } else {
            authService.logoutAndNavigateToHome(context, true, false);
          }
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Página Inicial'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.doorOpen), label: 'Sair')
        ],
      ),
    );
  }
}
