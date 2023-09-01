import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:st_credit/chart/donutChart.dart';
import 'package:st_credit/firebase/firebase_auth.dart';
import 'package:st_credit/firebase/firebase_service.dart';
import 'package:st_credit/pages/analyst/allRequests.dart';
import 'package:st_credit/pages/analyst/analystRequests.dart';
import 'package:st_credit/pages/analyst/approvedRequests.dart';
import 'package:st_credit/pages/analyst/deniedRequests.dart';
import 'package:st_credit/utils/utils.dart';

import 'clientInfo.dart';

class HomeAnalyst extends StatefulWidget {
  @override
  _HomeAnalystState createState() => _HomeAnalystState();
}

class _HomeAnalystState extends State<HomeAnalyst> {
  int _currentIndex = 0;
  int qtdClientesPendentes = 0;
  List<Map<String, dynamic>> allAnalysis = [];
  AuthService authService = AuthService();
  final FirebaseService firebaseService = FirebaseService();


  @override
  void initState() {
    super.initState();
    qtdRequests();
    getAnalysis();
  }

  Future<void> qtdRequests() async {
    int qtdPendentes = await firebaseService.getClientsInAnalysisCount();
    setState(() {
      qtdClientesPendentes = qtdPendentes;
    });
  }

  Future<void> getAnalysis() async {
    List<Map<String, dynamic>> analysis = await firebaseService.getAllAnalysis();
    setState(() {
      allAnalysis = analysis;
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
                          qtdClientesPendentes.toString(),
                          style: const TextStyle(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text("Histórico de análise"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  DonutChart(),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllRequests()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Text(
                              "Todos",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ),
                      ),
                      const SizedBox(width: 20),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ApprovedRequests()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Text(
                              "Aprovados",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ),
                      ),
                      const SizedBox(width: 20),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DeniedRequests()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Text(
                              "Negados",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text('Análises Recentes',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  ),
                  ...allAnalysis.reversed.take(3).map((data){
                    return ClientListItem(
                        data['nome'],
                        data['sobrenome'],
                        data['email']);
                  })
            ]))
            )],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          authService.logoutAndNavigateToHome(context);
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
  
  Widget ClientListItem(String name, String surname, email){
    return Padding(
        padding: EdgeInsets.only(top: 10),
      child: Row(
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
                child: Center(
                  child: Text(
                    Utils().getNameInitials(Utils().JoinNameAndSurname(name, surname)),
                    style: const TextStyle(
                        color: Color(0xFF2A64D9),
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(Utils().JoinNameAndSurname(name, surname))
            ],
          ),
          GestureDetector(
            onTap: () {
               Navigator.push(
                   context,
                   MaterialPageRoute(
                       builder: (context) => ClientInfo(email: email)));
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Text(
                "Acessar",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}

