import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:st_credit/chart/donutChart.dart';
import 'package:st_credit/firebase/firebase_service.dart';
import 'package:st_credit/firebase/getAllAnalysisWidget.dart';
import 'package:st_credit/firebase/firebase_auth.dart';
import 'package:st_credit/firebase/firebase_service.dart';
import 'package:st_credit/pages/analystRequests.dart';
import 'package:st_credit/utils/utils.dart';

import '../firebase/firebase_auth.dart';
import 'clientInfo.dart';

class HomeAnalyst extends StatefulWidget{

  final List<Map<String, dynamic>> data;
  HomeAnalyst({required this.data});
  @override
  _HomeAnalystState createState() => _HomeAnalystState(data: data);
}

class _HomeAnalystState extends State<HomeAnalyst> {
  int _currentIndex = 0;
  AuthService authService = AuthService();
  final List<Map<String, dynamic>> data;
  _HomeAnalystState({required this.data});
  @override
  void initState() {
    super.initState();
    qtdRequests();
  }

  Future<void> qtdRequests() async {
    int qtdPendentes = await firebaseService.getClientsInAnalysisCount();
    setState(() {
      qtdClientesPendentes = qtdPendentes;
    });
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
                          'Solicitações abertas',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          data.length.toString(),
                          style:  const TextStyle(
                              fontSize: 34,
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnalystRequests()));
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Icon(Icons.search),
                      ),
                    ),
                  )
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
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text("Histórico de análise")
                    ],
                  ),
                  const SizedBox(height: 20),
                  DonutChart(),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Text("Todos"),
                      SizedBox(width: 20),
                      Text("Aprovados"),
                      SizedBox(width: 20),
                      Text("Negados")
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xffE2E2E2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:  Center(
                              child: Text(
                                Utils().getNameInitials(Utils().JoinNameAndSurname(data[0]['nome'], data[0]['sobrenome'])),
                                style: const TextStyle(
                                    color: Color(0xFF2A64D9),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(Utils().JoinNameAndSurname(data[0]['nome'], data[0]['sobrenome']))
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => ClientInfo()));
                        },
                        child: const Text(
                          "Acessar",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xffE2E2E2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:  Center(
                              child: Text(
                                Utils().getNameInitials(Utils().JoinNameAndSurname(data[1]['nome'], data[1]['sobrenome'])),
                                style: const TextStyle(
                                    color: Color(0xFF2A64D9),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                           Text(Utils().JoinNameAndSurname(data[1]['nome'], data[1]['sobrenome']))
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => ClientInfo()));
                        },
                        child: const Text(
                          "Acessar",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xffE2E2E2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:  Center(
                              child: Text(
                                Utils().getNameInitials(Utils().JoinNameAndSurname(data[2]['nome'], data[2]['sobrenome'])),
                                style: const TextStyle(
                                    color: Color(0xFF2A64D9),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(Utils().JoinNameAndSurname(data[2]['nome'], data[2]['sobrenome']))
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => ClientInfo()));
                        },
                        child: const Text(
                          "Acessar",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ))
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
                      GetAllAnalysisWidget()),
            );
          } else {
            authService.logoutAndNavigateToHome(context);
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
