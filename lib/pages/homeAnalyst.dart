import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeAnalyst extends StatefulWidget{

  @override
  _HomeAnalystState createState() => _HomeAnalystState();
}

class _HomeAnalystState extends State<HomeAnalyst>{

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context){
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
                          "02",
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
                    child: const Center(
                      child: Text(
                        "+",
                        style: TextStyle(
                            color: Color(0xFF2A64D9),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container(
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
            ))
                  ],
                ),
              ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
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